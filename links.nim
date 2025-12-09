import re
import strutils
import os

proc links(path: string) =
  let dateText = readFile(path)

  let datePattern = re"""graphic\\ODYSSEY\\([A-Z0-9]+)\\en_US\\large_img"""

  let formattedDate = replacef(
    dateText,
    datePattern,
    "graphic\\ODYSSEY\\$1\\en_US\\large_img.jpg")

  echo path
  writeFile(path, formattedDate)

for f in walkFiles("/home/gs/xe_manual/topix/service/procedure/*"):
  links(f)
