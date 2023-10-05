echo "options hid_apple fnmode=0" | sudo tee /etc/modprobe.d/hid_apple.conf
# 0 = disabled: Disable the 'fn' key. Pressing 'fn'+'F8' will behave like you only press 'F8'
sudo update-initramfs -u -k all
sudo systemctl reboot

# /etc/bluetooth/main.conf
# FastConnectable = true

# Disable autosuspend for btusb to make the bluetooth keyboard work again
# this will erase any pre-existing contents from /etc/modprobe.d/btusb_disable_autosuspend.conf
# echo "options btusb enable_autosuspend=n" | sudo tee /etc/modprobe.d/btusb_disable_autosuspend.conf
# sudo update-initramfs -u
