library(vetiver)
library(pins)
library(plumber)

board <- board_folder("~/data/models/")

vetiver_prepare_docker(
  board,
  name = "penguin_model",
  version = "20250101T120810Z-99149",
  docker_args = list(
    port = 8080
  )
)
