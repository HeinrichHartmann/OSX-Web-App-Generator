#!/bin/sh

echo "What should the Application be called (no spaces allowed e.g. GCal)?"
read -e name

echo "What is the url (e.g. https://www.google.com/calendar/render)?"
read -e url

echo "What is the path to the icon (e.g. /Users/username/Desktop/icon.png)?"
read -e icon

chromePath="/Applications/Chromium.app/Contents/MacOS/Chromium"
installPrefix="/Applications/"

# various paths used when creating the app
resourcePath="$name.app/Contents/Resources"
execPath="$name.app/Contents/MacOS"
plistPath="$name.app/Contents/Info.plist"
profilePath="$name.app/Contents/Profile"

# make the directories
mkdir -p  $resourcePath $execPath $profilePath

# convert the icon and copy into Resources
if [ -f $icon ] ; then
    sips -s format tiff $icon --out $prefix$resourcePath/icon.tiff --resampleHeightWidth 128 128 >& /dev/null
    tiff2icns -noLarge $prefix$resourcePath/icon.tiff >& /dev/null
else
    printf "Icon not found\n" > /dev/stderr
fi

# create the executable
cat > $execPath/$name <<EOF
#!/bin/sh
exec $chromePath  --app="$url" --user-data-dir="$installPrefix$profilePath" "\$@"
EOF
chmod +x $execPath/$name

# create the Info.plist
cat > $plistPath <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" “http://www.apple.com/DTDs/PropertyList-1.0.dtd”>
<plist version=”1.0″>
<dict>
<key>CFBundleExecutable</key>
<string>$name</string>
<key>CFBundleIconFile</key>
<string>icon</string>
</dict>
</plist>
EOF
