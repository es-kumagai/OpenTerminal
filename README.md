# OpenTerminal for macOS

[![Build Status](https://travis-ci.org/es-kumagai/OpenTerminal.svg?branch=master)](https://travis-ci.org/es-kumagai/OpenTerminal)

![Icon](Resources/OpenTerminal.png)

This is a app for opening a `Terminal` window from `Finder` window.
You can use `iTerm2` window instead of `Terminal` window too.

## How to use

Just launch `OpenTerminal.app`. When do so, a new `Terminal` window will be opened and move the current directory to the app's bundle path. But usually, use this app in the following two ways.

### A) Launch from toolbar

We can also register this app to `Finder`'s toolbar, then launch it from there. In this way, we can open a new `Terminal` window with the finder's path as current directory immediately.

When you select a folder in a `Finder` window, you can open a new `Terminal` window and move the current directory to the selected folder's path by clicking this app's icon in the toolbar on the `Finder` window. Also you are able to selecting some of folders in a `Finder`window. In this time, each paths of folder's will be opend in separated `Terminal` windows.

Alternatively, you click with no selection, a new `Terminal` window will be opened with the path shown in `Finder` as current directory.

![Capture](Resources/capture.png)

### B) Launch from Dock

There is also a way to launch this app from macOS Dock.

<img src="Resources/launchFromDock.png" style="width: 76%"/>

## How to build

To build this app, open `Terminal` and clone this repository. Then move this project directory and type `xcodebuild`. By doing this, this app will be created in `build/Release` directory.

```bash
git clone https://github.com/es-kumagai/OpenTerminal.git
cd OpenTerminal

xcodebuild
```

## Prepare for use

There are two ways to use this app. 

### A) Register to toolbar

First, `OpenTerminal` app move to any folder (e.g. `/Application` or `~/Application`) then the app drag with `⌘`+`⌥` keys, and drop it to toolbar in a `Finder` window.

### B) Register to Dock

To drag this app and drop it to macOS Dock, the app will be registered to the Dock.

## Change Target Terminal

### Switch to iTerm 2

If you'd like to use `iTerm2` window instead of `Terminal` window, execute following command on Terminal,

```
defaults write jp.ez-style.appid.OpenTerminal ESTargetTerminalBundleIdentifier "com.googlecode.iterm2"
```

> In this time, Apple Script asks you to select `iTerm2` application. If asked, please select `iTerm2` application from displayed list.

### Switch to Apple Terminal

To use `Terminal` window, execute following command on Terminal,

```
defaults remove jp.ez-style.appid.OpenTerminal ESTargetTerminalBundleIdentifier
```
