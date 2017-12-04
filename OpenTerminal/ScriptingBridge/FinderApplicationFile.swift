//
//  FinderApplicationFile.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 12/4/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

/// Interface definition for `FinderApplicationFile` class.
///
/// Natively, `FinderApplicationFile` class is inherit `SBObject` class.
/// In Swift, to use `FinderApplicationFile` class, we need to downcast from `SBObject` instance to this class's.
@objc protocol FinderApplicationFileProtocol : FinderFileProtocol {
	
}

/// This extension is to be able to upcast `SBObject` instance to `FinderApplicationFile` instance.
extension SBObject : FinderApplicationFileProtocol {
	
}
