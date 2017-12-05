//
//  SBElementArray.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 12/5/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

extension SBElementArray {

	/// The first object in this instance.
	///
	/// SBElementArray's Element type (`Any`) is not conforms to `Equatable` protocol,
	/// so it don't have `first` property. You can use `firstObject` property instead of it.
	/// But I think it is not really swif-like name.
	var first: Any? {
		
		return firstObject
	}
}
