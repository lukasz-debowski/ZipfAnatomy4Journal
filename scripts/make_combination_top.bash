#!/bin/bash

cd ../output/

../scripts/make_combination_top.gpl

epstopdf token_ratio.eps token_ratio.pdf

cd ../scripts/

