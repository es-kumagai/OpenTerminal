# OpenTerminal for macOS

![Icon](Resources/OpenTerminal.png)

This is a app for opening a `Terminal` window from `Finder` window.

## How to use

Just launch `OpenTerminal.app`. When do so, a new `Terminal` window will be opened and move the current directory to the app's bundle path.

### Launch from toolbar

We can also register this apps to `Finder`'s toolbar, then launch it from there. In this way, we can open a new `Terminal` window with the finder's path as current directory immediately.

When you select a folder in a `Finder` window, you can open a new `Terminal` window and move the current directory to the `Finder`'s path by clicking this app's icon in the toolbar on the `Finder` window. otherwise, you click with no selection, a new `Terminal` window will be opened with the `Finder`'s path as current directory.

![Capture](Resources/capture.png)

## How to register to toolbar

First, `OpenTerminal` app move to any folder (e.g. `/Application` or `~/Application`) then the app drag with `⌘`+`⌥` keys, and drop it to toolbar in a `Finder` window.