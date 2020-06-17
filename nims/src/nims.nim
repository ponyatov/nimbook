
# https://github.com/komerdoor/nim-embedded-nimscript
# https://github.com/Serenitor/embeddedNimScript

import compiler/vm

proc execScript(scriptName: string): PSym = discard
proc cleanScript() = discard

if isMainModule:
  execScript("")
  cleanScript()
