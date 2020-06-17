# `nimpretty`
## утилита автоформатирования исходного кода на Nim

для автоматического соблюдения стиля кода, желательно поставить запуск в фоне после компилятора

```make
$(MODULE): src/$(MODULE).nim $(MODULE).nimble Makefile
	nimble build
	nimpretty $< &
```
правильно расставляюся отступы, пробелы, запятые, ограничение длины строки и т.п.
```sh
~/hello$ nimpretty src/hello.nim
```
