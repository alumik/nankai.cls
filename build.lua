module = "nankai"

typesetexe = "pdflatex"
unpackexe = "pdflatex"
makeindexexe = "makeindex"

typesetopts = "-shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1"

docfiles = {
  "nankai-sample-boring.tex",
  "nankai-sample-common.tex",
  "nankai-sample-slides-boring.tex",
  "nankai-sample-slides.tex",
  "nankai-sample.bib",
  "nankai-sample.tex",
}
typesetfiles = {
  "nankai.dtx",
  "nankai-sample-boring.tex",
  "nankai-sample-slides-boring.tex",
  "nankai-sample-slides.tex",
  "nankai-sample.tex",
}
