IMAGES = $(shell find . -name 'debian-live*' | tr -d './')

KVM_DEBIAN_PACKAGES = qemu-kvm \
	libvirt-clients \
	libvirt-daemon-system \
	bridge-utils \
	libguestfs-tools \
	genisoimage \
	virtinst \
	libosinfo-bin

ARCH = amd64

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
	sudo apt-get install -y live-build fdisk
	sudo apt install -y $(KVM_DEBIAN_PACKAGES)

build: clean
	sudo ./build.sh

build-iso: clean
	sudo ./build.sh iso

build-hdd: clean
	sudo ./build.sh hdd

clean: clean-image
	sudo lb clean --purge
	sudo rm -Rf config .build build.log
	rm -f *~

test-iso:
	sudo ../bin/boot-debian-iso.sh $(ISO_IMAGE)

test-hdd:
	sudo ../bin/boot-debian-img.sh $(ISO_IMAGE)

image:
	docker build -t $(IMAGE) .

run: image
	docker run --privileged -u root -v .:/results --rm $(IMAGE)

clean-image:
	docker rmi $(IMAGE)
