#!/bin/bash
#
# Build and launch the face tracking example.

make -C src/ all

./src/viztracker models/facetrack
