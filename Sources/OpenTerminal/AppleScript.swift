//
//  AppleScript.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 7/26/18.
//  Copyright © 2018 EasyStyle G.K. All rights reserved.
//

import Foundation

extension NSAppleScript {

	enum Error : Swift.Error {
		
		case executionFailure(errorInfo: NSDictionary)
	}
}

extension NSAppleScript {
	
	@discardableResult
	func execute() throws -> NSAppleEventDescriptor {
		
		var errorInformation: NSDictionary?
		let result = executeAndReturnError(&errorInformation)
		
		guard errorInformation == nil else {
			
			throw Error.executionFailure(errorInfo: errorInformation!)
		}
		
		return result
	}
}
