build: clean
	sudo ./build.sh

clean:
	sudo lb clean --purge
	sudo rm -Rf config .build build.log
	rm -f *~

test-iso:
	sudo kvm -cdrom *.iso

test-img:
	sudo kvm -hda *.img

