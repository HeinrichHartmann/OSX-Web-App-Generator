# OSX Web-App Generator

## Usage Example

```
; ./makeapp.sh

What should the Application be called?
> GCal

What is the url?
> https://www.google.com/calendar/render

What is the path to the icon?
> gcal.ico
```
Creates a `GCal` Application in the current working directory.

```
./install.sh GCal
```
Installs ComDirekt Application to /Applications.

## Features

By default each App runs in a separate Browser Profile.  Use `CTRL-,` to change settings.

Library of useful Web-Applications is included in this repository. Feel free to contribute more.

## Motivation

- Reduce distraction by opening Web Applications directly without entering the distracting context
  of a browser. E.g. to wire a transfer.

- Site-Specific Browser (SSB) feature of Firefox looks discontinued
  https://superuser.com/questions/468580/create-application-shortcut-chromes-feature-in-firefox
  Hence this version is based on Chromium.

## Credits

Based on https://gist.github.com/sanfordredlich/4568525
