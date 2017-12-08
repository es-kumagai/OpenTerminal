//
//  FinderFinderWindow.swift
//  OpenTerminalApp
//
//  Created by Tomohiro Kumagai on 12/5/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

/// Interface definition for `FinderFinderWindow` class.
///
/// Natively, `FinderFinderWindow` class is inherit `SBObject` class.
/// In Swift, to use `FinderWindow` class, we need to downcast from `SBObject` instance to this class's.
@objc protocol FinderFinderWindowProtocol : FinderWindowProtocol {
	
	/// the container at which this file viewer is targeted
	@objc optional var target: SBObject { get set }
}

/// This extension is to be able to upcast `SBObject` instance to `FinderFinderWindow` instance.
extension SBObject : FinderFinderWindowProtocol {
	
}
