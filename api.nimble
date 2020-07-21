# Package

version       = "0.1.0"
author        = "Brandon Atkinson"
description   = "Demo REST API using Nim and Jester"
license       = "MIT"
srcDir        = "src"
bin           = @["api"]

# Dependencies

requires "nim >= 1.2.4"
requires "https://github.com/dom96/jester == 0.4.3"
