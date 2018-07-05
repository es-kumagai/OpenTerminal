//
//  URL.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 7/5/18.
//  Copyright © 2018 EasyStyle G.K. All rights reserved.
//

import Foundation

private let fileManager = FileManager()

extension URL {

	var pathForAppleScriptWithEscapedSpace: String {
		
		return "\(path.replacingOccurrences(of: " ", with: "\\\\ "))"
	}
	
	var truncatedToDirectoryName: URL {
		
		var isDirectory: ObjCBool = false
		var isFile: Bool {
			
			return !isDirectory.boolValue
		}
		
		guard fileManager.fileExists(atPath: path, isDirectory: &isDirectory) else {
			
			// Return self if the url is not exists. This is an unexpected case.
			return self
		}
		
		guard isFile else {
			
			return self
		}
		
		return deletingLastPathComponent()
	}
}

extension Sequence where Element == URL {
	
	var uniquelySet: Set<Element> {
		
		return Set(self)
	}
}
