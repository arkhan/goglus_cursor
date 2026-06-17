#!/usr/bin/env python3
"""
Generate HiDPI scaled PNGs and update .in files for Wayland/HiDPI support.
Run from source/ directory.  Idempotent — safe to run multiple times.

Output sizes: 32 (base), 48 (1.5×), 64 (2×), 96 (3×)
Special case : crossed_circle base=24  → 24, 36, 48, 72
Skipped      : none.in (transparent 1×1, size irrelevant)
"""
import os, subprocess, re

SRC = os.path.dirname(os.path.abspath(__file__))

# Target nominal sizes per base
SIZE_MAP = {
    32: [32, 48, 64, 96],
    24: [24, 36, 48, 72],
}

def scale_hotspot(hx, hy, base, target):
    r = target / base
    return round(hx * r), round(hy * r)

def resize_png(src_png, dst_png, size):
    subprocess.run(
        ['convert', src_png, '-filter', 'Lanczos',
         '-resize', f'{size}x{size}', dst_png],
        check=True
    )

def scaled_name(png, size, base):
    """Return filename for a scaled PNG, or original if size==base."""
    if size == base:
        return png
    stem, ext = os.path.splitext(png)
    return f'{stem}_{size}{ext}'

def is_base_png(png):
    """True if this PNG is an original (no _NN size suffix)."""
    stem = os.path.splitext(png)[0]
    return not re.search(r'_\d+$', stem)

def process_in_file(in_path):
    name = os.path.basename(in_path)[:-3]

    if name == 'none':
        return  # transparent cursor, size irrelevant

    with open(in_path) as f:
        raw_lines = [l.rstrip('\n') for l in f if l.strip()]

    # Detect if already multi-size (idempotency guard)
    first_sizes = [int(l.split()[0]) for l in raw_lines]
    if len(set(first_sizes)) > 1:
        print(f'  skip {name}.in (already multi-size)')
        return

    base = int(raw_lines[0].split()[0])
    targets = SIZE_MAP.get(base)
    if targets is None:
        print(f'  skip {name}.in (unknown base size {base})')
        return

    new_lines = []
    for line in raw_lines:
        parts   = line.split()
        size_b  = int(parts[0])
        hx, hy  = int(parts[1]), int(parts[2])
        png     = parts[3]
        delay   = parts[4] if len(parts) > 4 else None

        # Only expand base PNGs — skip if png already has a size suffix
        if not is_base_png(png):
            print(f'  WARN: unexpected non-base png {png} in {name}.in, skipping')
            new_lines.append(line)
            continue

        for t in targets:
            dst_png = scaled_name(png, t, base)
            thx, thy = scale_hotspot(hx, hy, base, t)

            if t != base:
                dst_path = os.path.join(SRC, dst_png)
                if not os.path.exists(dst_path):
                    print(f'    resize {png} → {dst_png}')
                    resize_png(os.path.join(SRC, png), dst_path, t)

            entry = f'{t} {thx} {thy} {dst_png}'
            if delay:
                entry += f' {delay}'
            new_lines.append(entry)

    with open(in_path, 'w') as f:
        f.write('\n'.join(new_lines) + '\n')
    print(f'  updated {name}.in ({len(new_lines)} entries)')


if __name__ == '__main__':
    os.chdir(SRC)
    for in_file in sorted(os.listdir('.')):
        if in_file.endswith('.in'):
            print(f'--- {in_file}')
            process_in_file(in_file)
    print('\nDone.')
