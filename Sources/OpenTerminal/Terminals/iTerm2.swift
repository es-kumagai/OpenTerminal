//
//  iTerm2.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 7/5/18.
//  Copyright © 2018 EasyStyle G.K. All rights reserved.
//

import Foundation

final class ITerm2 : Terminal {

	func open(url: URL) throws {
		
		let source = """
		
		tell application "iTerm2"
		
			create window with default profile
		
			tell current session of current window
				write text "cd \(url.pathForAppleScriptWithEscapedSpace)"
			end tell

		end tell
		"""
		
		let script = NSAppleScript(source: source)!
		var errorInformation: NSDictionary?
		
		script.executeAndReturnError(&errorInformation)
		
		guard errorInformation == nil else {
			
			throw OpenError.failedToExecuteAppleScript(errorInfo: errorInformation!)
		}
	}
}
