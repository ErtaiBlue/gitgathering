#!/bin/bash

while read cardname
  do
	curl -L -o ./Images/$(echo $cardname | sed "s/ /_/g;s/\/\//to/;s/'//;s/!//").jpg "https://api.scryfall.com/cards/named?exact=$(echo $cardname | sed "s/%/%25/g;s/ /%20/g;s/!/%21/g;s/\"/%22/g;s/#/%23/g;s/&/%26/g;s/'/%27/g;s/(/%28/g;s/)/%29/g;s/\*/%2A/g;s/\+/%2B/g;s/,/%2C/g;s/\//%2F/g;s/:/%3A/g;s/;/%3B/g;s/=/%3D/g;s/?/%3F/g;s/@/%40/g;s/\[/%5B/g;s/\]/%5D/g;s/\\$/%24/")&format=image" # the terrible sed expression is used for [url encoding](https://en.wikipedia.org/wiki/URL_encoding)
  done < <(grep -v "^$\|^//\|^\[\[.*\]\]" ./list.deck | cut -d " " -f2-)
