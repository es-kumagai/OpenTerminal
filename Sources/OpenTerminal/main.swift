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
//let terminal = SBApplication(bundleIdentifier: "com.apple.Terminal")! as TerminalApplicationProtocol
let terminal = SBApplication(bundleIdentifier: "com.googlecode.iterm2")! as ITermApplicationProtocol

let selection = finder.selection!
let selectionItems = selection.get() as! Array<AnyObject>

let fileUrls: Array<String>

print(type(of: terminal))

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
//		let window = terminal.createWindow!(withDefaultProfileCommand: "")
//		window.writeContents!(of: URL(fileURLWithPath: "/tmp/a.txt"), text: "TEXT", newline: true)

		let source = """

		tell application "iTerm2"

			create window with default profile

			tell current session of current window
			write text "cd \(url.pathForAppleScriptWithEscapedSpace)"
		
		end tell

		end tell
		"""
		
		let script = NSAppleScript(source: source)!
		script.executeAndReturnError(nil)
		
		dump(NSWorkspace.shared.activeApplication())
		let iterm = NSWorkspace.shared.frontmostApplication!
		print(iterm.localizedName!)
		print(iterm as? NSApplication)
		let windowList = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as! NSArray
		print("🌻", windowList.firstObject)

//		print(iterm.perform(#selector(getter: windows)))
		
//		let a = (terminal as! AnyObject).window!.firstResponder!
//		let responder = (window as! AnyObject).window!.firstResponder!
//		let event = NSEvent.keyEvent(with: .keyDown, location: .zero, modifierFlags: [], timestamp: Date().timeIntervalSinceReferenceDate, windowNumber: 0, context: nil, characters: "AAA", charactersIgnoringModifiers: "", isARepeat: false, keyCode: UInt16("A".cString(using: .ascii)![0]))!
		
//		responder.keyDown!(with: event)

//	terminal.open!(with: [url.path])
//	terminal.activate!()
}
