#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
echo "dtoverlay=dwc2" >> /boot/config.txt
echo "dwc2" >> /etc/modules
echo "libcomposite" >> /etc/modules
sed -i '/^exit 0$/i \
/usr/bin/rucky
' /etc/rc.local
cat <<EOF > /etc/avahi/services/rucky.service
<?xml version="1.0" standalone='no'?>
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
  <name>Rucky</name>
  <service>
    <type>_rucky._tcp</type>
    <port>5000</port>
  </service>
</service-group>
EOF
cat <<EOF > /usr/bin/hidk
#!/bin/bash
cd /sys/kernel/config/usb_gadget/
mkdir -p ruckyHID
cd ruckyHID
echo 0x1d6b > idVendor # Linux Foundation
echo 0x0104 > idProduct # Multifunction Composite Gadget
echo 0x0100 > bcdDevice # v1.0.0
echo 0x0200 > bcdUSB # USB2
mkdir -p strings/0x409
echo "fedcba9876543210" > strings/0x409/serialnumber
echo "Mayank Metha D" > strings/0x409/manufacturer
echo "Rucky" > strings/0x409/product
mkdir -p configs/c.1/strings/0x409
echo "Config 1: ECM network" > configs/c.1/strings/0x409/configuration
echo 250 > configs/c.1/MaxPower
# Add functions here
mkdir -p functions/hid.usb0
echo 1 > functions/hid.usb0/protocol
echo 1 > functions/hid.usb0/subclass
echo 8 > functions/hid.usb0/report_length
echo -ne \\x05\\x01\\x09\\x06\\xa1\\x01\\x05\\x07\\x19\\xe0\\x29\\xe7\\x15\\x00\\x25\\x01\\x75\\x01\\x95\\x08\\x81\\x02\\x95\\x01\\x75\\x08\\x81\\x03\\x95\\x05\\x75\\x01\\x05\\x08\\x19\\x01\\x29\\x05\\x91\\x02\\x95\\x01\\x75\\x03\\x91\\x03\\x95\\x06\\x75\\x08\\x15\\x00\\x25\\x65\\x05\\x07\\x19\\x00\\x29\\x65\\x81\\x00\\xc0 > functions/hid.usb0/report_desc
ln -s functions/hid.usb0 configs/c.1/
# End functions
ls /sys/class/udc > UDC
#fix hidg0 permission
chmod 777 /dev/hidg0
EOF
chmod 777 /usr/bin/hidk
mv "$(dirname "$0")"/rucky /usr/bin/rucky
chmod 777 /usr/bin/rucky
reboot
