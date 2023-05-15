BINARY = iso
IMAGE = iso-builder-$(shell basename `pwd`)
ISO_IMAGE = $(IMAGE)-$(ARCH).iso

all: build-$(BINARY)

clean-image:
	docker rmi $(IMAGE)

include ../Makefile
