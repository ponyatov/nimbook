QEMU  = qemu-system-ppc
ARGS  = -M mac99 -m 512M
# hdd
HDA   = tiger10.hda
ARGS += -hda $(HDA) -boot c
# network
ARGS += -netdev user,id=mynet0 -device rtl8139,netdev=mynet0
# misc
ARGS += -device usb-kbd -device usb-mouse
# -localtime
# verbose
ARGS += -prom-env boot-args=-v

all: emu

emu: $(HDA)
	$(QEMU)	$(ARGS)

$(HDA):
	qemu-img create $@ 1M

debian:
	sudo apt update
	sudo apt install -u `cat apt.txt`
