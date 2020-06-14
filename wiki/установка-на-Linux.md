# установка на Linux

https://nim-lang.org/install_unix.html

* компилятор устанавливается в домашний каталог пользователя, и не затрагивает системную файловую систему
* для работы нужно добавить пути в `$PATH` и создать пару [[переменных среды|переменные среды]]

```sh
~$ curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

```
nimtest@debian:~$ curl https://nim-lang.org/choosenim/init.sh -sSf | sh
choosenim-init: Downloading choosenim-0.6.0_linux_amd64
    Prompt: Can choosenim record and send anonymised telemetry data? [y/n]
        ... Anonymous aggregate user analytics allow us to prioritise
        ... fixes and features based on how, where and when people use Nim.
        ... For more details see: https://goo.gl/NzUEPf.
    Answer: y
Downloading Nim 1.2.0 from nim-lang.org
[###############################################   ] 94.72% 752kb/s
 Extracting nim-1.2.0-linux_x64.tar.xz
   Building Nim 1.2.0
  Compiler: Already built
     Tools: Already built
  Installed component 'nim'
  Installed component 'nimble'
  Installed component 'nimgrep'
  Installed component 'nimpretty'
  Installed component 'nimsuggest'
  Installed component 'testament'
   Switched to Nim 1.2.0
choosenim-init: ChooseNim installed in /home/nimtest/.nimble/bin
choosenim-init: You must now ensure that the Nimble bin dir is in your PATH.
choosenim-init: Place the following line in the ~/.profile or ~/.bashrc file.
choosenim-init:     export PATH=/home/nimtest/.nimble/bin:$PATH
```
### [[переменные среды]]

```sh
~$ echo "export PATH=\$HOME/.nimble/bin:\$PATH" >> ~/.setenv
~$ echo ". ~/.setenv" >> ~/.profile
~$ echo ". ~/.setenv" >> ~/.xsesstionrc
~$ . ~/.setenv
```
### установка пакетов дистрибутива Linux

Так как [[транслятор Nim работает через генерацию кода на Си]], в системе должен быть установлен `$CC`, обычно это GNU `gcc`, но может использоваться и [[компилятор Intel]]. Также для работы необходимо несколько утилит управления проектом и контроля версий:
```sh
~$ sudo apt install -u git make build-essential
[sudo] пароль для ponyatov: 
Чтение списков пакетов… Готово
Построение дерева зависимостей       
Чтение информации о состоянии… Готово
Уже установлен пакет build-essential самой новой версии (12.6).
Уже установлен пакет git самой новой версии (1:2.20.1-2+deb10u3).
Уже установлен пакет make самой новой версии (4.2.1-1.2).
Обновлено 0 пакетов, установлено 0 новых пакетов, для удаления отмечено 0 пакетов, и 14 пакетов не обновлено.
```
```sh
~$ gcc --version
gcc (Debian 8.3.0-6) 8.3.0
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```
#### кросс-компилятор [[arm-none-eabi]]

### проверка

```sh
~$ . ~/.setenv

~$ nim -v
Nim Compiler Version 1.2.0 [Linux: amd64]
Compiled at 2020-04-03
Copyright (c) 2006-2020 by Andreas Rumpf

active boot switches: -d:release

~$ nimble -v
nimble v0.11.0 compiled at 2020-04-03 12:49:03
git hash: couldn't determine git hash

```

### обновление

```sh
~$ choosenim update self
   Updating choosenim
      Info: Already up to date at version 0.6.0
```
```sh
~$ choosenim update stable
   Updating stable
      Info: Already up to date at version 1.2.0
```

## [[choosenim]]
## [[nimble]]
## [[nimc]]
