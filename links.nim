import re
import strutils
import os

proc links(path: string) =
  let dateText = readFile(path)

  let datePattern = re"""graphic\\ODYSSEY\\([A-Z0-9]+)\\en_US\\_img.jpg"""

  let formattedDate = replacef(
    dateText,
    datePattern,
    "graphic\\ODYSSEY\\$1\\en_US\\img.jpg")

  echo path
  writeFile(path, formattedDate)

proc ren(path: string) =
  let (dir, name, ext) = splitFile(path)
  moveFile(path, dir & "/img.jpg")

for f in walkFiles("/home/gs/xe_manual/topix/service/procedure/*"):
  links(f)
