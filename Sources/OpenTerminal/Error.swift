//
//  Error.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 7/5/18.
//  Copyright © 2018 EasyStyle G.K. All rights reserved.
//

import Foundation

enum OpenError : Error {
	
	case cannotSpecifyTargetTerminal
	case failedToExecuteAppleScript(errorInfo: NSDictionary)
}

extension OpenError {

	init(appleScriptExecutionError error: Swift.Error) {
		
		guard let error = error as? NSAppleScript.Error else {
			
			self = .failedToExecuteAppleScript(errorInfo: [:])
			return
		}
		
		switch error {
			
		case .executionFailure(errorInfo: let errorInfo):
			self = .failedToExecuteAppleScript(errorInfo: errorInfo)
		}
	}
}

extension OpenError : CustomStringConvertible {
	
	var description: String {
		
		switch self {
			
		case .cannotSpecifyTargetTerminal:
			return "Cannot specify a target terminal for open."
			
		case .failedToExecuteAppleScript(errorInfo: let errorInfo):
			return "Failed to execute an Apple Script. \(errorInfo)"
		}
	}
}
