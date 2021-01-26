#!/bin/bash

find ./main ./test \( -type d -name idea -prune \) -o \( -type d -name .git -prune \) -o -name "*.java" -type f -print0 | xargs -0 sed -i 'sorg\.moita/org\.moita\.app/g'
