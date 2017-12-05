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

let selection = finder.selection!
let selectionItems = selection.get() as! Array<AnyObject>

let fileUrls: Array<String>

if selectionItems.isEmpty {
	
	let finderWindow = finder.finderWindows!().firstObject as! FinderFinderWindowProtocol
	let targetedContainer = finderWindow.target!
	let targetItem = targetedContainer.get() as! FinderItemProtocol

	fileUrls = [targetItem.url!]
}
else {
	
	fileUrls = selectionItems
		.flatMap { item in item as? FinderApplicationFileProtocol }
		.flatMap { file in file.url }
}

fileUrls
	.flatMap(URL.init(string:))
	.forEach { url in

	terminal.open!(with: [url.path])
	terminal.activate!()
}
