# сборка кросс-компилятора `i486-elf`

```sh
~$ git clone -o gh https://github.com/ponyatov/nimos ; cd nimos
~/nimos$ make cross
```

**Целевая архитектура** задается в нескольких файлах, пока жёстко под i486 PC (как максимально совместимый с любым x86 ПК), но в потенциале набор платформ может быть расширен:

```make
HW = qemu386
# include hw/$(HW).mk
CPU = i486
# include cpu/$(CPU).mk
ARCH = i386
# include arch/$(ARCH).mk
TARGET = $(CPU)-elf
```

Кросс-компилятор при сборка устанавливается в каталог `$(CWD)/$(TARGET)`, структура каталогов:

```make
# временные файлы для сборки пакетов из исходного кода
# nimos/tmp
TMP   = $(CWD)/tmp

# распакованные исходники libs/binutils/gcc/gdb/...
# nimos/tmp/src
SRC   = $(TMP)/src

# где хранить скачанные архивы
# ~/gz
GZ    = $(HOME)/gz

# сюда будут попадать собранные прошивки (загрузочные образы, бинарники)
# nimos/firmware
FWARE = $(CWD)/firmware

# каталог установленного кросс-компилятора
# nimos/i486-elf
# сюда компилируются библиотеки для целевой платформы (i486, arm, ppc...)
# nimos/i486-elf/sysroot
CROSS = $(CWD)/$(TARGET)

.PHONY: dirs
dirs:
	mkdir -p $(TMP) $(SRC) $(GZ) $(FWARE) $(CROSS) $(CROSS)/sysroot
```
