//
//  main.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 12/4/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import AppKit
import ScriptingBridge

let finder = SBApplication(bundleIdentifier: "com.apple.Finder")! as FinderApplicationProtocol

let selection = finder.selection!
let selectionItems = selection.get() as! Array<AnyObject>

let filePaths: Array<String>

updateAppIcon()

if selectionItems.isEmpty {
	
	// This case is for launch from Toolbar.
	let window = finder.windows!().first as! FinderFinderWindowProtocol
	let container = window.target!
	let item = container.get() as! FinderItemProtocol
	
	filePaths = [item.url!]
}
else {
	
	// This case is for launch from Finder directly.
	filePaths = selectionItems
		.compactMap { $0 as? FinderApplicationFileProtocol }
		.compactMap { $0.url }
}

filePaths
	.compactMap { URL.init(string: $0) }
	.compactMap { $0.truncatedToDirectoryName }
	.uniquelySet
	.forEach { url in
	
	do {
		
		guard let terminal = settings.terminal else {
			
			throw OpenError.cannotSpecifyTargetTerminal
		}
		
		try terminal.open(url: url)
	}
	catch {
		
		alert(message: "\(error)")
	}
}
