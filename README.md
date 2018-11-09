# Dotfiles

`dotfiles` es mi colección personal de archivos de configuración para algunas de las aplicaciones que uso en i3 Manjaro Linux

## Requisitos

### yay AUR Helper

```sh
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```

### Nerd Fonts

```sh
$ yay -S  nerd-fonts-complete
```

### i3lock-color

```sh
$ yay -S i3lock-color-git
```

### Glava

```sh
$ yay -S glava
```

### .Xresources

```
#URxvt.font:                       9x15,xft:TerminessTTFNerdFontMono
URxvt.font: xft:DejaVu Sans Mono:pixelsize=11
```

### Copy Files

```sh
$ cp -r .config/conky ~/.config/
$ sudo cp usr/bin/* /usr/bin/
$ sudo touch /usr/share/backgrounds/login.jpg
$ sudo chmod 777 /usr/share/backgrounds/login.jpg
```

## Install Software

```sh
$ yay -S python-pywal
$ yay -S feh
```

### Edit Pacman

```sh
$ sudo nano /etc/pacman.conf
```

```
# Misc options
Color
ILoveCandy
```

### Zsh

`.zshrc`

```sh
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh%    
```

# LightDM

`/etc/lightdm/slick-greeter.conf`

```
[Greeter]
background=/usr/share/backgrounds/login.jpg
```


- [i3](#i3)
- [polybar](#polybar)
- [python-wal](#pywal)
- [dunst](#dunst)
- [dmenu](#dmenu)
- [rofi](#rofi)
- [vim](#vim)



<a name="#i3"></a>
# i3
Config file `~/.i3/config` edit:

```
# Set colors from Xresources
# Change 'color7' and 'color2' to whatever colors you want i3 to use 
# from the generated scheme.
# NOTE: The '#f0f0f0' in the lines below is the color i3 will use if
# it fails to get colors from Xresources.
set_from_resource $fg i3wm.color7 #f0f0f0
set_from_resource $bg i3wm.color2 #f0f0f0

# class                 border  backgr. text indicator child_border
client.focused          $bg     $bg     $fg  $bg       $bg
client.focused_inactive $bg     $bg     $fg  $bg       $bg
client.unfocused        $bg     $bg     $fg  $bg       $bg
client.urgent           $bg     $bg     $fg  $bg       $bg
client.placeholder      $bg     $bg     $fg  $bg       $bg

client.background       $bg

# PROTIP: You can also dynamically set dmenu's colors this way:
bindsym $mod+d exec dmenu_run -nb "$fg" -nf "$bg" -sb "$bg" -sf "$fg"
```

```sh
 colors {
        background $bg
        statusline $color15
        separator  $color8

#                      border  backgr. text
        focused_workspace  $color15 $color6 $bg
        active_workspace   $color8 $color8 $fg
        inactive_workspace $color8 $bg $fg
        binding_mode       $color8 $color6 $bg
        urgent_workspace   $color6 $bg $fg
    }

```

# Playerctl

```
# Media player controls
bindsym XF86AudioPause exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5%
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle
```


<a name="#polybar"></a>
# polybar

Config file `~/.config/polybar/config`

```
[colors]
background = ${xrdb:color0:#222}
foreground = ${xrdb:color7:#222}
foreground-alt = ${xrdb:color7:#222}
primary = ${xrdb:color1:#222}
secondary = ${xrdb:color2:#222}
alert = ${xrdb:color3:#222}

[bar/bar]
; ...
background = ${colors.background}
foreground = ${colors.foreground}
```


<a name="#pywal"></a>
# python-wal

`/usr/bin/wal-set`

```
#!/usr/bin/env bash
#
# Script to set colors generated by 'wal'
# https://github.com/dylanaraps/wal

# Source generated colors.
. "${HOME}/.cache/wal/colors.sh"


reload_conky() {
	sed -i"" --follow-symlinks \
        -e "s/color2 = '.*'/color2 = \"${color15:-#263238}\"/" \
        "/usr/share/conky/conky1.10_shortcuts_maia"
}

reload_dunst() {
	sed -i"" --follow-symlinks \
        -e "s/background = \"#.*\"/background = \"${color0:-#263238}\"/" \
        -e "s/foreground = \"#.*\"/foreground = \"${color15:-#556064}\"/" \
        -e "s/frame_color = \"#.*\"/frame_color = \"${color0:-#788388}\"/" \
        "${HOME}/.config/dunst/dunstrc"


}

reload_rofi() {

}

reload_dmenu() {

}

main() {
    reload_dunst &
   # xrdb -merge ~/.cache/wal/rofi.xres &
   # wal-discord; beautifuldiscord --css "${HOME}/.cache/wal-discord/style.css"
}

main
```


<a name="#dunst"></a>
# dunst

`~/.config/dunst/dunstrc`

```
frame_color = "#788388"
[urgency_low]
    # IMPORTANT: colors have to be defined in quotation marks.
    # Otherwise the "#" and following would be interpreted as a comment.
    background = "#263238"
    foreground = "#556064"
    timeout = 10

[urgency_normal]
    background = "#263238"
    foreground = "#F9FAF9"
    timeout = 10

[urgency_critical]
    background = "#D62929"
    foreground = "#F9FAF9"
    timeout = 0

```

<a name="#dmenu"></a>
# dmenu

 `~/.dmenurc`

```
## background colour for unselected menu-items
DMENU_NB="#222D31"

## textcolour for unselected menu-items
DMENU_NF="#F9FAF9"

## background colour for selected menu-items
DMENU_SB="#16A085"

## textcolour for selected menu-items
DMENU_SF="#F9FAF9"

```



<a name="#rofi"></a>
# rofi

`~/.config/rofi/config`

```
# Dark theme.
rofi.theme: ~/.cache/wal/colors-rofi-dark.rasi

# Light theme.
rofi.theme: ~/.cache/wal/colors-rofi-light.rasi
```


<a name="#vim"></a>
# vim

### Install vim-plug

```sh
$ yay vim-plug
```

### Edit ~/.vimrc

```
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
colo desert
syntax on

call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'

call plug#end()

```

Open vim and run `:PlugInstall`
