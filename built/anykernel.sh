# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Overdose XVII - Love You 3000 Times
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=ASUS_X00TD
device.name2=X00TD
device.name3=X00T
device.name4=ASUS_X00T
device.name5=ASUS_X00TDA
supported.versions=8.1 - 10.0
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

# Mount partitions as rw
mount /system;
mount /vendor;
mount -o remount,rw /system;
mount -o remount,rw /vendor;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# Backup init.rc
backup_file init.rc;

# Overdose's Ramdisk Removal & Injection
rm -rf $ramdisk/init.trb.rc;
rm -rf $ramdisk/init.azure.rc;
rm -rf $ramdisk/init.Pbh.rc;
rm -rf $ramdisk/init.PbH.rc;
rm -rf $ramdisk/init.darkonah.rc;
rm -rf $ramdisk/init.spectrum.rc;
rm -rf $ramdisk/init.spectrum.sh;
rm -rf $ramdisk/init.special_power.sh;
rm -rf $ramdisk/init.thundercloud.rc;
rm -rf $ramdisk/init.thundercloud.sh;

remove_line init.rc "import /init.trb.rc"
remove_line init.rc "import /init.azure.rc"
remove_line init.rc "import /init.PbH.rc"
remove_line init.rc "import /init.Pbh.rc"
remove_line init.rc "import /init.darkonah.rc"
remove_line init.rc "import /init.overdose.rc"
remove_line init.rc "import /init.thundercloud.rc"
remove_line init.rc "import /init.spectrum.rc"
remove_line init.rc "import /init.pk.rc"
remove_line init.rc "import /init.boost.rc"
remove_line init.rc "import /init.stardust.rc"
insert_line init.rc "import /init.overdose.rc" after "import /init.usb.configfs.rc" "import /init.overdose.rc";

# end ramdisk changes

## backup post-boot script
#if [ ! -f /vendor/bin/init.qcom.post_boot.sh.bkp ]; then
#	cp -rpf /vendor/bin/init.qcom.post_boot.sh /vendor/bin/#init.qcom.post_boot.sh.bkp;
#fi

# replace post-boot script
#cp -rpf $patch/init.qcom.post_boot.sh /vendor/bin/init.qcom.post_boot.sh;

#chmod -R 755 /vendor/bin/init.qcom.post_boot.sh;
#chmod -R 755 /vendor/bin/init.qcom.post_boot.sh.bkp;


# end ramdisk changes

write_boot;
## end install

