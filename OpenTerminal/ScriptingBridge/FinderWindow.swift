//
//  FinderWindow.swift
//  OpenTerminalApp
//
//  Created by Tomohiro Kumagai on 12/5/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

/// Interface definition for `FinderWindow` class.
///
/// Natively, `FinderWindow` class is inherit `SBObject` class.
/// In Swift, to use `FinderWindow` class, we need to downcast from `SBObject` instance to this class's.
@objc protocol FinderWindowProtocol {
	
}

/// This extension is to be able to upcast `SBObject` instance to `FinderWindow` instance.
extension SBObject : FinderWindowProtocol {
	
}
