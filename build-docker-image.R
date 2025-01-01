library(vetiver)
library(pins)
library(plumber)

board <- board_folder(fs::path_wd("data/models/"))

vetiver_prepare_docker(
  board,
  name = "penguin_model",
  version = "20250101T020503Z-99149",
  docker_args = list(
    port = 8080
  )
)
