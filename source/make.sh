#!/bin/sh
# Build Goglus cursor theme
# Run from source/ directory: sh make.sh

set -e

# --- Generate animated/static cursors ---
xcursorgen left_ptr_watch.in cursors/left_ptr_watch
xcursorgen hand1.in          cursors/hand1
xcursorgen hand1.in          cursors/hand2
xcursorgen left_ptr.in       cursors/left_ptr
xcursorgen center_ptr.in     cursors/center_ptr
xcursorgen xterm.in          cursors/xterm
xcursorgen crossed_circle.in cursors/crossed_circle
xcursorgen right_ptr.in      cursors/right_ptr
xcursorgen copy.in           cursors/copy
xcursorgen move.in           cursors/move
xcursorgen link.in           cursors/link
xcursorgen circle.in         cursors/circle
xcursorgen sb_h_double_arrow.in cursors/sb_h_double_arrow
xcursorgen sb_v_double_arrow.in cursors/sb_v_double_arrow
xcursorgen top_left_corner.in   cursors/top_left_corner
xcursorgen top_right_corner.in  cursors/top_right_corner
xcursorgen bottom_left_corner.in  cursors/bottom_left_corner
xcursorgen bottom_right_corner.in cursors/bottom_right_corner
xcursorgen fd_double_arrow.in cursors/fd_double_arrow
xcursorgen bd_double_arrow.in cursors/bd_double_arrow
xcursorgen watch.in           cursors/watch
xcursorgen sb_left_arrow.in   cursors/sb_left_arrow
xcursorgen sb_right_arrow.in  cursors/sb_right_arrow
xcursorgen sb_up_arrow.in     cursors/sb_up_arrow
xcursorgen sb_down_arrow.in   cursors/sb_down_arrow
xcursorgen based_arrow_down.in cursors/based_arrow_down
xcursorgen based_arrow_up.in   cursors/based_arrow_up
xcursorgen bottom_side.in     cursors/bottom_side
xcursorgen top_side.in        cursors/top_side
xcursorgen left_side.in       cursors/left_side
xcursorgen right_side.in      cursors/right_side
xcursorgen fleur.in           cursors/fleur
xcursorgen question_arrow.in  cursors/question_arrow
xcursorgen top_tee.in         cursors/top_tee
xcursorgen bottom_tee.in      cursors/bottom_tee
xcursorgen left_tee.in        cursors/left_tee
xcursorgen right_tee.in       cursors/right_tee
xcursorgen ul_angle.in        cursors/ul_angle
xcursorgen ll_angle.in        cursors/ll_angle
xcursorgen ur_angle.in        cursors/ur_angle
xcursorgen lr_angle.in        cursors/lr_angle
xcursorgen X_cursor.in        cursors/X_cursor
xcursorgen crosshair.in       cursors/crosshair
xcursorgen cross.in           cursors/cross
xcursorgen tcross.in          cursors/tcross
xcursorgen dotbox.in          cursors/dotbox
xcursorgen plus.in            cursors/plus
xcursorgen pencil.in          cursors/pencil
xcursorgen dnd-none.in        cursors/dnd-none
xcursorgen dnd-copy.in        cursors/dnd-copy
xcursorgen dnd-link.in        cursors/dnd-link
xcursorgen dnd-move.in        cursors/dnd-move
xcursorgen dnd-ask.in         cursors/dnd-ask
xcursorgen none.in            cursors/none

cd cursors

# --- Aliases: legacy names / hash names ---

# dotbox variants
ln -sf dotbox         draped_box
ln -sf dotbox         icon
ln -sf dotbox         target
ln -sf dotbox         dot_box_mask

# X_cursor variants
ln -sf X_cursor       pirate

# left_ptr variants
ln -sf left_ptr       arrow
ln -sf left_ptr       top_left_arrow
ln -sf left_ptr       default

# right_ptr variants
ln -sf right_ptr      draft_large
ln -sf right_ptr      draft_small

# move hash names
ln -sf move           4498f0e0c1937ffe01fd06f973665830
ln -sf move           9081237383d90e509aa00f00170e968f

# copy hash names
ln -sf copy           1081e37283d90000800003c07f3ef6bf
ln -sf copy           6407b0e94181790501fd1e167b474872

# cross variants
ln -sf cross          cross_reverse
ln -sf cross          diamond_cross

# hand1 / hand2 variants
ln -sf hand1          9d800788f1b08800ae810202380a0822
ln -sf hand2          e29285e634086352946a0e7090d73106
ln -sf hand1          hand
ln -sf hand1          grab
ln -sf hand2          grabbing
ln -sf hand2          pointer

# question_arrow / help variants
ln -sf question_arrow d9ce0ab605698f320427677b458ad60b
ln -sf question_arrow 5c6cd98b3f3ebcb1f9c7f1c204630408
ln -sf question_arrow help
ln -sf question_arrow left_ptr_help
ln -sf question_arrow context-menu

# link / alias variants
ln -sf link           3085a0e285430894940527032f8b26df
ln -sf link           640fb0e74195791501fd1ed57b41487f
ln -sf link           alias

# crossed_circle variants
ln -sf crossed_circle 03b6e0fcb3499374a867c041f52298f0
ln -sf crossed_circle no-drop
ln -sf crossed_circle not-allowed

# fd_double_arrow variants
ln -sf fd_double_arrow fcf1c3c7cd4491d801f1e1c78f100000
ln -sf fd_double_arrow nesw-resize

# bd_double_arrow variants
ln -sf bd_double_arrow c7088f0f3e6c8088236ef8e1e3e70000
ln -sf bd_double_arrow nwse-resize

# based_arrow variants
ln -sf based_arrow_up   base_arrow_up
ln -sf based_arrow_down base_arrow_down

# sb_h_double_arrow variants
ln -sf sb_h_double_arrow h_double_arrow
ln -sf sb_h_double_arrow 14fef782d02440884392942c11205230
ln -sf sb_h_double_arrow 028006030e0e7ebffc7f7070c0600140
ln -sf sb_h_double_arrow ew-resize
ln -sf sb_h_double_arrow col-resize

# sb_v_double_arrow variants
ln -sf sb_v_double_arrow double_arrow
ln -sf sb_v_double_arrow v_double_arrow
ln -sf sb_v_double_arrow 2870a09082c103050810ffdffffe0204
ln -sf sb_v_double_arrow 00008160000006810000408080010102
ln -sf sb_v_double_arrow ns-resize
ln -sf sb_v_double_arrow row-resize

# center_ptr
ln -sf center_ptr     centre_ptr

# xterm variants
ln -sf xterm          text
ln -sf xterm          vertical-text

# watch variants
ln -sf watch          wait
ln -sf watch          box_spiral
ln -sf watch          clock
ln -sf watch          coffee_mug

# left_ptr_watch (progress) hash names
ln -sf left_ptr_watch 08e8e1c95fe2fc01f976f1e063a24ccd
ln -sf left_ptr_watch 3ecb610c1bf2410f44200f48c40d3599
ln -sf left_ptr_watch progress

# resize cardinal directions
ln -sf top_side           n-resize
ln -sf bottom_side        s-resize
ln -sf right_side         e-resize
ln -sf left_side          w-resize
ln -sf top_right_corner   ne-resize
ln -sf bottom_right_corner se-resize
ln -sf bottom_left_corner sw-resize
ln -sf top_left_corner    nw-resize

# fleur variants
ln -sf fleur          all-scroll
ln -sf fleur          exchange
ln -sf fleur          gobbler
ln -sf fleur          sizing

# plus variants
ln -sf plus           cell
ln -sf plus           zoom-in
ln -sf plus           zoom-out

# crosshair variants
ln -sf crosshair      dot
ln -sf crosshair      iron_cross
ln -sf crosshair      spider

# pencil variants
ln -sf pencil         spraycan

# left_ptr fallback for truly decorative legacy cursors
ln -sf left_ptr       boat
ln -sf left_ptr       gumby
ln -sf left_ptr       heart
ln -sf left_ptr       leftbutton
ln -sf left_ptr       man
ln -sf left_ptr       middlebutton
ln -sf left_ptr       mouse
ln -sf left_ptr       rightbutton
ln -sf left_ptr       rtl_logo
ln -sf left_ptr       sailboat
ln -sf left_ptr       star
ln -sf left_ptr       trek
ln -sf left_ptr       umbrella

# X_cursor fallback
ln -sf X_cursor       bogosity
