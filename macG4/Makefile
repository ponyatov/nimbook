QEMU  = qemu-system-ppc
ARGS  = -M mac99 -m 512M
HDA   = tiger10.hda
ARGS += -hda $(HDA) -boot c -netdev user,id=mynet0 -device rtl8139,netdev=mynet0
ARGS += -device usb-kbd -device usb-mouse -localtime

all: run

run: $(HDA)
	$(QEMU)	$(ARGS)

$(HDA):
	qemu-img create $@ 1M

debian:
	sudo apt update
	sudo apt install -u `cat apt.txt`
