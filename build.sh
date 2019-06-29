	#!/bin/bash
	clear
	echo Overdose Kernel Compile Tool
	echo By MrDarkness
	echo Please Sit Back And Chill...
	export MAIN=`readlink -f ../`
	export KERNELDIR=`readlink -f .`
	rm $KERNELDIR/built/Image.gz-dtb
	rm $KERNELDIR/built/kernel_output.txt
	export CROSS_COMPILE=$MAIN/aarch64-linux-gnu/bin/aarch64-linux-gnu-   
	export ARCH=arm64
	make X00T_defconfig
	make -j$(nproc --all) | tee $KERNELDIR/built/kernel_output.txt
	mv $KERNELDIR/arch/arm64/boot/Image.gz-dtb $KERNELDIR/built/Image.gz-dtb
	echo ""
	echo "Compile Done"
	echo ""
	cd $KERNELDIR/built
	zip -r Overdose-XVIII-Release-X00T-`date +%Y%m%d_%H%M`.zip * -x "kernel_output.txt" "*.zip"
	cd $KERNELDIR/
	echo "Zip Done"

