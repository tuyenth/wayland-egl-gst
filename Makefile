CC=gcc
PKGCONFIG=`pkg-config --cflags --libs gstreamer-1.0 gstreamer-plugins-bad-1.0 gstreamer-video-1.0 wayland-client wayland-egl gl egl`
CFLAGS=-I/usr/include -lgstwayland-1.0 $(PKGCONFIG)

$(info CFLAGS is $(CFLAGS))

debug:clean
	$(CC) $(CFLAGS) -Wall -g -o wayland-egl-gst main.c
stable:clean
	$(CC) $(CFLAGS) -o wayland-egl-gst main.c
clean:
	rm -vfr *~ wayland-egl-gst
install:
	cp wayland-egl-gst $(INSTALL_ROOT)/usr/bin
