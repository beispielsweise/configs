# Configuration files by bspw.
This is a very minimal hyprland configuration. Easy to understand, does not include any fancy themeswitching and scripting. <br>

## Hyprland
### Required apps:
For screenshots: ```grim slurp wl-copy wl-clipboard```<br>
Apps used in setup: ```alacritty swaync hyprlock swww waybar imv yad rofi pcmanfm-gtk3 scrcpy pavucontrol```<br>
Some external modules and apps: ```xdg-desktop-portal-hyprland bc pamixer brightnessctl network-manager-applet```<br>
### After installation:
1. [Hyprland setup](https://github.com/beispielsweise/configs/blob/main/config/hypr/README.md)<br>
2. [Waybar setup](https://github.com/beispielsweise/configs/blob/main/config/waybar/README.md)<br>
3. Install GTK theme: [WhiteSur-Dark](https://github.com/vinceliuice/WhiteSur-gtk-theme/tree/master)
4. Install JetbrainsMono Nerd font: copy ttf files to ```~/.local/share/fonts/``` then ```fc-cache -f -v```
4. [Swww setup](https://github.com/beispielsweise/configs/blob/main/config/swww/README.md)<br>

## i3:
i3 base installation required and ```picom polybar```<br>
[Picom setup hints](https://github.com/beispielsweise/configs/blob/main/config/picom/README.md)<br>

### For Neovim, check [Nvim setup hints](https://github.com/beispielsweise/configs/blob/main/config/nvim/README.md):
### Setups
To setup and use second built-in SSD natively, preform the following steps:
1. Disable hybernation in Windows (Via regedit)
2. Create a directory for your disc e.g. ```mkdir -p ~/SSD2```
3. Run ```sudo blkid```. Search for ```LABEL="1TB" BLOCK_SIZE="512" UUID="0624F1AC24F19F3D" TYPE="ntfs"```, important is the __LABEL__ matching the one you entered in windows. __TYPE__ should be NTFS. <br>
copy the UUID
4. Open the ```/etc/fstab``` file and add the following line:<br>
```
UUID=COPIED_UUID /home/USERNAME/SSD2 ntfs-3g defaults,nofail,uid=1000,gid=1000,umask=0022 0 0
```
<br>Just in case, check if the uid and gid values are correct by running ```id -u``` and ```id -g```

## Apps
## MControlCenter
Controlls fans on an MSI laptop (Arch kernels have all modules, unlike fedora/pop_os or others) <br>
To use an unsupported version (Like in my case)
1. Open ```msi-ec.c``` in the cloned repository 
2. Locate a piece of code that will look like this: <br>
```
result = ec_get_firmware_version(ver_by_ec);
if (result < 0)
    return result;

ver = ver_by_ec;
```
After the variable ```ver``` insert ```pr_info("MSI EC: FIRMWARE_READ = %s\n", ver);```
3. Recompile ```make```, reinstall ```sudo make install``` and __REBOOT__ your system
4. After rebooting, paste ```sudo modprobe msi-ec```<br>
5. Now retrieve your EC firmware version via ```dmesg | grep -i FIRMWARE_READ``` to confirm, if it matches one under UNSUPPORTED and has a config available. 
In my case it was MSI Katana GF76 UC11 / 17L1EMS1.107
6. Search for the corresponding config (for 17L1EMS1 it is conf14). 
It would look like this: a structure, where the number matches the one in confX:
```
static const char *ALLOWED_FW_14[] __initconst = {
	"17L2EMS1.108", // Katana 17 B11UCX, Katana GF76 11UC
	"17L1EMS1.107", // -> insert EC version here
	NULL
};
```
Insert the previously found EC version, preserving the formatting. 
7. Recompile ```make```, reinstall ```sudo make install``` and __REBOOT__ your system
> [!NOTE]
> The module needs to be reinstalled on each linux kernel update
### EasyEffects
For a microphone upgrade. Make sure to tick "Launch on startup" in preferences.
