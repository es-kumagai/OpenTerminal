//
//  FinderFile.swift
//  OpenTerminalApp
//
//  Created by Tomohiro Kumagai on 12/4/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

/// Interface definition for `FinderFile` class.
///
/// Natively, `FinderFile` class is inherit `SBObject` class.
/// In Swift, to use `FinderFile` class, we need to downcast from `SBObject` instance to this class's.
@objc protocol FinderFileProtocol : FinderItemProtocol {
	
}

/// This extension is to be able to upcast `SBObject` instance to `FinderFile` instance.
extension SBObject : FinderFileProtocol {
	
}
