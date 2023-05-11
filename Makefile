IMAGES = $(shell find . -name 'debian-live*' | tr -d './')

KVM_DEBIAN_PACKAGES = qemu-kvm \
	libvirt-clients \
	libvirt-daemon-system \
	bridge-utils \
	libguestfs-tools \
	genisoimage \
	virtinst \
	libosinfo-bin

build-all:
	for dir in $(IMAGES); do \
		$(MAKE) -C $$dir build; \
	done

clean-all:
	for dir in $(IMAGES); do \
		$(MAKE) -C $$dir clean; \
	done
	rm -f *~ */*~

install:
	sudo apt-get install -y live-build
	sudo apt install -y $(KVM_DEBIAN_PACKAGES)

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

