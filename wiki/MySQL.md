# MySQL/MariaDB

Одна из самых распространённых полноценных СУБД, библиотеки для Nim включают биндинги для `libmysql-dev`

* https://nim-lang.org/docs/db_mysql.html

## пример: миграция данных между БД на разных серверах

* `migrate.nimble`
```nim
description   = "MySQL data migration in Nim lang"

# зависимости

requires "nim >= 1.2.0"
# not requires "db_mysql" в составе библиотеки
```
* `src/migrate.nim`
```nim
import db_mysql
```
```nim
# БД-источник

const FROM_IP = "192.168.123.45"
const FROM_LOGIN = "user"
const FROM_PSWD = "password"
const FROM_DB = "forecast"
```
```nim
# БД-приёмник

# from djangobully import settings
## пока возможность разбора файла конфигурации на Python проигнорируем

const TO_IP = "127.0.0.1"
const TO_LOGIN = "bully"
const TO_PSWD = "hiddenpassword"
const TO_DB = "bully"
```

```nim
# немного тёплых логов
when isMainModule:
  addHandler(log)
  log.log(lvlInfo, "")
  log.log(lvlInfo, "FROM: db:" & $FROM_DB & "\t@ " & $FROM_IP & "\tlogin:" & FROM_LOGIN)
  log.log(lvlInfo, "  TO: db:" & $TO_DB & "\t@ " & $TO_IP & "\tlogin:" & TO_LOGIN)
```
```
./forecast
[2020-06-15 17:02:39] - INFO: 
[2020-06-15 17:02:39] - INFO: FROM: db:forecast @ 192.168.23.45 login:user
[2020-06-15 17:02:39] - INFO:   TO: db:bully    @ 127.0.0.1     login:bully
```

```nim
# открываем БД-источник

let dbin = db_mysql.open(FROM_IP, FROM_LOGIN, FROM_PSWD, FROM_DB)
```
```
./forecast
[2020-06-15 17:08:17] - INFO: 
[2020-06-15 17:08:17] - INFO: FROM: db:forecast @ 192.168.9.133 login:root
[2020-06-15 17:08:17] - INFO:   TO: db:bully    @ 127.0.0.1     login:bully
/home/ponyatov/bully/src/forecast.nim(41) forecast
/home/ponyatov/.choosenim/toolchains/nim-1.2.0/lib/impure/db_mysql.nim(390) open
/home/ponyatov/.choosenim/toolchains/nim-1.2.0/lib/pure/db_common.nim(100) dbError
Error: unhandled exception: Unknown database 'forecast' [DbError]
make: *** [Makefile:164: forecast] Ошибка 1
```
Как видим, даже выводятся какие-то вменяемые сообщения об ошибках.
