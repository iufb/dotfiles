#!/bin/bash

# Get the MRU (most recently used) input sources
locales=$(gsettings get org.gnome.desktop.input-sources mru-sources)

# Extract the second item (layout code) from the first tuple
current=$(echo "$locales" | awk -F"'" '{print $4}')

echo "$current"

