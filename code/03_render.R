here::i_am("code/03_render.R")

library(rmarkdown)
render(
  "Part2.Rmd",
  output_file = "Part2.pdf"
)

