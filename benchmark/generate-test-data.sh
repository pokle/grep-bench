#!/usr/bin/env bash

TARGET=8 # Gigabytes

NEEDLE="A very fine needle."

function make_hay() {
	# (length(HAY) + length("\n")) ** 24 == 1gb
	HAY='Hey is hay the same as haay hey haai hei huh najfw and more hay'

	mkdir -p data
	echo $HAY > data/hay
	for ((i=0; i<24; i++)); do
		cat data/hay data/hay >> data/stack
		mv data/stack data/hay
	done
}

function make_haystack() {
	rm -f data/haystack

	for (( i=0; i<$TARGET; i++ )); do 
		cat data/hay >> data/haystack
		echo $NEEDLE >> data/haystack
		du -h data/haystack
	done
}

make_hay
make_haystack
rm -f data/hay