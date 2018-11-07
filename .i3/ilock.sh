#!/bin/bash


B='#00000000'  # blank
C='#578AAB22'  # clear ish
D='#578AABcc'  # default
T='#578AABee'  # text
W='#121212bb'  # wrong
V='#121212bb'  # verifying

i3lock -m \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 2         \
--veriftext="Verificando" \
--wrongtext="Denegado" \



i3lock -u 
#xset dpms force off
