//
//  main.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 12/4/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

let finder = SBApplication(bundleIdentifier: "com.apple.Finder")! as FinderApplicationProtocol
//let terminal = SBApplication(bundleIdentifier: "com.apple.Terminal")! as TerminalApplicationProtocol
let terminal = SBApplication(bundleIdentifier: "com.googlecode.iterm2")! as ITermApplicationProtocol

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
		.compactMap { $0 as? FinderApplicationFileProtocol }
		.compactMap { $0.url }
}

fileUrls
	.compactMap { URL(string: $0) }
	.forEach { url in

		// I don't know how to change current path and keep opening the iTerm window.
		let window = terminal.createWindow!(withDefaultProfileCommand: "")
		window.writeContents!(of: URL(fileURLWithPath: "/tmp/a.txt"), text: "TEXT", newline: true)

//	terminal.open!(with: [url.path])
//	terminal.activate!()
}
