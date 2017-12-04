//
//  main.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 12/4/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

let finder = SBApplication(bundleIdentifier: "com.apple.Finder")! as FinderApplicationProtocol
let selection = finder.selection!
let selectionItems = selection.get() as! Array<AnyObject>

let fileUrl: String

switch selectionItems.first {
	
// This case is for launch from Finder directly.
case .some(let targetItem as FinderApplicationFileProtocol):
	fileUrl = targetItem.url!

case .some(_):
	fatalError("Expect that target item is a FinderApplicationFile.")
	
// This case is for launch from Toolbar.
case .none:
	let finderWindow = finder.finderWindows!().firstObject as! FinderFinderWindowProtocol
	let targetedContainer = finderWindow.target!
	let targetItem = targetedContainer.get() as! FinderItemProtocol
	
	fileUrl = targetItem.url!
}

let url = URL(string: fileUrl)!

let terminal = SBApplication(bundleIdentifier: "com.apple.Terminal")! as TerminalApplicationProtocol

terminal.activate!()
terminal.open!(with: [url.path])

