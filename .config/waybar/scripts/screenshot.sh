#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

grimblast save area "$HOME/Screenshots/$TIMESTAMP.png"

notify-send "Screenshot saved"
```
