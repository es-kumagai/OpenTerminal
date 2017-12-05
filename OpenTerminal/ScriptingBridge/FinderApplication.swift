//
//  FinderApplication.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 12/4/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

/// Interface definition for `FinderApplication` class.
///
/// This interface is used for controll `Finder` application through ScriptingBridge framework.
/// To use this instance, we have to declare the interface myself.
@objc protocol FinderApplicationProtocol {
	
	@objc(FinderWindows) optional func windows() -> SBElementArray

	/// The selection in the frontmost Finder window.
	@objc optional var selection: SBObject { get set }

	/// Activate the specified window or the Finder.
	@objc optional func activate()
}

/// To downcast from `SBApplication` instance to `FinderApplication` instance,
/// to conform `SBApplication` to `FinderApplicationProtocol'.
extension SBApplication : FinderApplicationProtocol {
	
}
