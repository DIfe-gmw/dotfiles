
# I3 Configuration

<img src="https://i.imgur.com/SMO1ooh.png" width=1000>

---
**Version 1.0.1**

Code and files for the purpose of editing the default i3 design, using tools like **Polybar**, **Picom**, **Feh** and **Font Awesome**. Links for their github repositories below in order respectively,  more details about this project is also below.

This project was made in:
**OS:** Artix Linux OpenRC x86_64
**Kernel:** 5.14.11-xanmod1-1
**WM:** i3-gaps
**Terminal:** Alacritty

Themes used:
**Theme:** Arc-Dark [GTK2/3]
**Icons:** Moka [GTK2/3]

https://github.com/polybar/polybar

https://github.com/yshui/picom

https://github.com/derf/feh

https://github.com/FortAwesome/Font-Awesome

---

### License & Copyright

I'm not entitled to any copyright in this project as this was largely made with community and open-source templates and tools, or FOSS.
Basically use this as you wish, just respect the licenses of the tools used.

### Contributors

- [DIfe-gmw](https://github.com/DIfe-gmw)
 ---
 ### Install Guide
 
 As this project was made in Artix, i cannot guarantee that it will work on Debian-based distros nor will i provide the exact commands for installing in this guide.

So, let's begin.

---
First of all, clone this repository using git clone:

```
$ git clone https://github.com/DIfe-gmw/dotfiles
```
Then open your preferred terminal and follow to the next step

---
Polybar and picom are necessary packages so do:

```
$ sudo pacman -S polybar picom
```
---
After that, we need to set up the  configuration, this is just a matter of placing files in the right place, it is possible to do this step in a file manager, or you can do it with style.

---
### File Manager
If you want to do it with a file manager just put these files in the following directories:

**picom.conf** > /etc/xdg/picom.conf

**.fonts** > The Home directory, most likely called ~

**Pictures** > Also the Home directory

**polybar** > ~/.config

**i3** > ~/.config

**Pictures folder** > ~/

**.bashrc** > ~/
After you've done it just fully reload I3 with $mod+Shift+e and exit, relog into your user and it should work.
But if you prefer to do it with style we are not finished yet, follow me 

---

### Command Line 

If you decided to do it with style, good! we will use the 'cp' command for copying the files to their right directories and cd to change directories.

**Change into the cloned git repository**
```
$ cd path/to/folder
```

**Picom**
```
$ sudo cp -r ./picom.conf /etc/xdg/picom.conf
```
**.fonts**
```
$ sudo cp -r ./.fonts ~/.fonts
```
**Polybar**
```
$ sudo cp -r ./polybar ~/.config/
```
**I3**
```
$ sudo cp -r ./i3 ~/.config/
```
**Pictures**
```
$ sudo cp -r ./Pictures ~/
```
**Pictures**
```
$ sudo cp -r ./.bashrc ~/
```
---








