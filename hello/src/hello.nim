
import logging
let logger = newConsoleLogger(fmtStr = "[$date $time] - $levelname: ")

when isMainModule:
  echo("Hello, World!")
  addHandler(logger)
  logger.log(lvlInfo, "info")
  logger.log(lvlDebug, "debug")
