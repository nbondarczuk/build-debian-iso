IMAGES = $(shell find . -name 'debian-live*' | tr -d './')

build:
	for dir in $(IMAGES); do \
		$(MAKE) -C $$dir build; \
	done

clean:
	for dir in $(IMAGES); do \
		$(MAKE) -C $$dir clean; \
	done
	rm -f *~ */*~

install:
	sudo apt-get install -y live-build kvm
