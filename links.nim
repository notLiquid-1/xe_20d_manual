import re
import strutils
import os

proc links(path: string) =
  let dateText = readFile(path)

  # let datePattern = re""""\<body\>\n\<h4\>\<a href\=\"\/\"\>Home menu\<\/a\>\<\/h4\>""""

  let formattedDate = replace(
    dateText,
    """<div style="display: none;" class="collapsible-list">""",
    """<div class="collapsible-list">""")

  echo path
  writeFile(path, formattedDate)

for f in walkFiles("/home/gs/xe_manual/topix/service/procedure/*.html"):
  links(f)
