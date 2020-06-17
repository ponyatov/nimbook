# Package | Пакет

version       = "0.1.0"
author        = "Dmitry Ponyatov <dponyatov@gmail.com>"
description   = "Hello World"
license       = "MIT"
srcDir        = "src"
bin           = @["hello"]

# Dependencies | Зависимости

## привязка к версии языка Nim
requires "nim >= 1.2.0"
## использование сторонней библиотеки, без указания версии
# requires "ncurses"
