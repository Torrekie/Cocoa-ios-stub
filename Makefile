CC := $(shell xcrun -sdk iphoneos clang)

COCOA_VERSION=23

tree/Library/Frameworks/Cocoa.framework/Cocoa:
	$(CC) $(CFLAGS) $(LDFLAGS) \
		-DVERSION_NUMBER=$(COCOA_VERSION) \
		-DVERSION_STRING="\"@(#)PROGRAM:Cocoa  PROJECT:Cocoa-$(COCOA_VERSION)\"" \
		-Wl,-source_version,$(COCOA_VERSION) \
		-current_version $(COCOA_VERSION) -compatibility_version 1 \
		-Wl,-reexport_framework,Foundation \
		-Wl,-reexport_framework,UIKit \
		-Wl,-reexport_framework,CoreData \
		-install_name /Library/Frameworks/Cocoa.framework/Cocoa \
		-dynamiclib -o tree/Library/Frameworks/Cocoa.framework/Cocoa Cocoa.c

all: tree/Library/Frameworks/Cocoa.framework/Cocoa

clean:
	rm -f *.o tree/Cocoa

package: tree/Library/Frameworks/Cocoa.framework/Cocoa
	fakeroot dpkg -b tree/ .
