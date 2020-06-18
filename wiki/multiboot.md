# `multiboot` загрузчик

https://wiki.osdev.org/Multiboot

Самый универсальный способ загрузки на архитектуре x86, поддерживаемый любым распространённым загрузчиком. Не поддерживается на других архитектурах, см. [[uboot]]

`src/multiboot.S`

В примере stand-alone проекта [[nimkernel]] предоставлен **минимальный загрузчик для i386**, подключение которого в начало вашей прошивки сделает ёё загружаемой любым загрузчиком -- [[syslinux]], [[GRUB]], или `qemu -kernel firmware.elf`

```make
src/multiboot.S:
	$(WGET) -O $@ https://github.com/dom96/nimkernel/raw/master/boot.s
```

Есть две версии спецификации интерфейса загрузчика:
* [Multiboot Specification version 0.6.96](https://www.gnu.org/software/grub/manual/multiboot/multiboot.html)
  * [перевод](http://gownos.blogspot.com/2011/10/multiboot-specification.html)
* [Multiboot2 Specification version 2.0](https://www.gnu.org/software/grub/manual/multiboot2/multiboot.html)