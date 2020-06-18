# Mac OS X 10.4 Tiger

[[Mac Mini G4]]

Для компиляции на устройстве требуется версия Xcode 2.5 для PowerPC: файл образа диска `xcode25_8m2558_developerdvd.dmg`

## Установка в эмулятор QEMU

* https://github.com/ponyatov/nimbook/tree/master/macG4
  * https://wiki.qemu.org/Documentation/GuestOperatingSystems/MacOS10.4

distro: https://archive.org/details/MacOSX10.4.10-Mac-2Z691-6089-A_2Z691-6113-A

```sh
~/nimbook/macG4$ make debian
~/nimbook/macG4$ make emu
```
