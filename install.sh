APP="${1%/}"

# copy to Applications
cp -v -R "$APP" /Applications/

printf "open /Applications/$APP"
