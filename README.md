
# I3 Configuration

<img src="https://i.imgur.com/SMO1ooh.png" width=1000>

---
**Version 1.0.1**

Code and files for the purpose of editing the default i3 design, using tools like **Polybar**, **Picom**, **Feh** and **Font Awesome**. Links for their github repositories below in order respectively,  more details about this project is also below.

This project was made in:<br>
**OS:** Artix Linux OpenRC x86_64<br>
**Kernel:** 5.14.11-xanmod1-1<br>
**WM:** i3-gaps<br>
**Terminal:** Alacritty<br>

Themes used:<br>
**Theme:** Arc-Dark [GTK2/3]<br>
**Icons:** Moka [GTK2/3]<br>

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
These are necessary packages so do:

```
$ sudo pacman -S polybar picom rofi neofetch feh
```
---
After that, we need to set up the  configuration, this is just a matter of placing files in the right place and adjusting the monitor polybar config,

---
### File Manager
If you want to do it with a file manager just put these files in the following directories:

**picom.conf** > /etc/xdg/picom.conf

**.fonts** > The Home directory, most likely called ~

**Pictures** > Also the Home directory

**polybar** > ~/.config

**i3** > ~/.config/config

**Pictures folder** > ~/

**.bashrc** > ~/

After you've done it just fully reload I3 with $mod+Shift+e and exit, and follow to the next step

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
$ sudo cp -r ./i3/config ~/.config/
```
**Pictures**
```
$ sudo cp -r ./Pictures ~/
```
**.bashrc**
```
$ sudo cp -r ./.bashrc ~/
```
---

Now to the final step!

Open ~/.config/polybar/config with your preferred text editor and delete from bar/example-hdmi1 to bar/example-dp1

<img src="https://i.imgur.com/ShikZzj.png" width=800>

Don't forget to delete the bar/example-hdmi1 module too!
After that configure your monitor by inserting the id, if you don't know your monitor's id refer to [xrandr](https://wiki.archlinux.org/title/Xrandr)

<img src="https://i.imgur.com/VKuv5zf.png" width=500>

After that go to **~/.config/polybar/launch.sh**
Remove all HDMI-1 instances and change "grep 'DP-1'" to "grep 'your-monitor-id'"

<img src="https://i.imgur.com/YiE743z.png" width=500>

And you're done! Enjoy your new design.




