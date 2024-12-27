# DevOps for Data Science

## Overview

Just working through the book DevOps for Data Science.


## Setup
- Using `renv` for R, and to setup the python virtual environment
  - restore project with `renv::restore()`
- .Rprofile has been modified to use `libcrul` and `pak::pak()` 
to install packages because `renv::instal()` just *could not* for the life of me
install `duckdb`.  YMMV, so check if you need those setting and edit .Rpofile 
accordingly.
- source `setup_duckdb.R` to setup the duckdb database
- source/render `model.qmd` to serve the model through an API
