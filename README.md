# DevOps for Data Science

## Overview

Just working through the book DevOps for Data Science.


## Setup
- Using `renv` for R, and to setup the python virtual environment
  - restore project with `renv::restore()`
- .Rprofile has been modified to use `libcurl` and `pak::pak()`
to install packages because `renv::install()` just *could not* for the life of
me install `duckdb` on pop_os!.  YMMV, so check if you need those setting and
edit .Rprofile accordingly.
- source `setup_duckdb.R` to setup the duckdb database
- source `py_setup.R` to setup the python environment
- source/render `model.qmd` to serve the model through an API
