#PREFIX=/home/embedded
#PREFIX=/home/bk/rpi/mod_build/tmp/work/armv6-vfp-poky-linux-gnueabi/opencv/2.4.6+gitAUTOINC+c5afaa4e8d-r0/sysroot-destdir/usr
PREFIX=/home/bk/rpi/mod_build/tmp/sysroots/raspberrypi
SOURCE=camera_calibration.cpp hdmi_show.cpp
FLAGS=-g --sysroot=${PREFIX}
COMPILER=/home/bk/rpi/mod_build/tmp/sysroots/x86_64-linux/usr/bin/armv6-vfp-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++

compile:
	${COMPILER} ${FLAGS} -I ${PREFIX}/usr/include -I ${PREFIX}/usr/include/opencv -L/home/bk/rpi/mod_build/tmp/sysroots/raspberrypi/usr/lib -L/home/bk/rpi/mod_build/tmp/sysroots/raspberrypi/lib -L/home/bk/rpi/mod_build/tmp/sysroots/raspberrypi -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_ml -lopencv_features2d -lopencv_calib3d -lopencv_objdetect -lopencv_flann -lpthread ${SOURCE} -o test_opencv_calib

install_it:
	scp -rp * root@192.168.87.102:/home/root/test_opencv_calib/
	ssh root@192.168.87.102 "~/test_opencv_calib/test_opencv_calib"

deploy:
	compile() install_it()


sdmv:
	scp test_opencv root@192.168.87.102:/home/root
