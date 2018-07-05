//
//  URL.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 7/5/18.
//  Copyright © 2018 EasyStyle G.K. All rights reserved.
//

import Foundation

extension URL {
	
	var pathForAppleScriptWithEscapedSpace: String {
		
		return "\(path.replacingOccurrences(of: " ", with: "\\\\ "))"
	}
}
