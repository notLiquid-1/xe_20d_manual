import re
import strutils
import os

proc links(path: string) =
  let dateText = readFile(path)

  let datePattern = re"""graphic\\RTS\\([A-Z0-9]+)\\en_GB\\_img.gif"""

  let formattedDate = replacef(
    dateText,
    datePattern,
    "graphic\\RTS\\$1\\en_GB\\img.gif")

  echo path
  writeFile(path, formattedDate)

proc ren(path: string) =
  let (dir, name, ext) = splitFile(path)
  moveFile(path, dir & "/img.gif")

for f in walkFiles("/home/gs/xe_manual/topix/service/graphic/RTS/*/en_GB/_img.gif"):
  ren(f)
