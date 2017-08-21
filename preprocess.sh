#!/bin/bash

# replaces multiple spaces with commas
# so that spark can process it later

sed -i -E 's/ {2,}/,/g' stats*
