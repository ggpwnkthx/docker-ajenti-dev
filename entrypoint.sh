#!/bin/bash

cd /plugin
ajenti-dev-multitool --bower install
ajenti-dev-multitool --rebuild
ajenti-dev-multitool --run-dev
