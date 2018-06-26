//
//  main.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 12/4/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

let finder = SBApplication(bundleIdentifier: "com.apple.Finder")! as FinderApplicationProtocol
let terminal = SBApplication(bundleIdentifier: "com.apple.Terminal")! as TerminalApplicationProtocol

let manager = FileManager()

let selection = finder.selection!
let selectionItems = selection.get() as! Array<AnyObject>

let fileUrls: Array<String>

if selectionItems.isEmpty {
	
	// This case is for launch from Toolbar.
	let window = finder.windows!().first as! FinderFinderWindowProtocol
	let container = window.target!
	let item = container.get() as! FinderItemProtocol

	fileUrls = [item.url!]
}
else {
	
	// This case is for launch from Finder directly.
	fileUrls = selectionItems
		.flatMap { $0 as? FinderApplicationFileProtocol }
		.flatMap { $0.url }
}

let toDir: (URL) -> (URL) = {
	url in
	
	var isDir:ObjCBool = false
	manager.fileExists(atPath: url.path, isDirectory: &isDir)
	
	if isDir.boolValue {
		return url
	} else {
		return url.deletingLastPathComponent()
	}
}

Set(fileUrls
	.flatMap { URL(string: $0) }
	.flatMap(toDir))
	.forEach { url in

	terminal.open!(with: [url.path])
	terminal.activate!()
}
