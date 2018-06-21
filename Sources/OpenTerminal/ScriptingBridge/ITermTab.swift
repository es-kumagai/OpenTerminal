//
//  ITermTab.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 6/22/18.
//  Copyright © 2018 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

/// Interface definition for `TerminalApplication` class.
///
/// This interface is used for controll `Terminal` application through ScriptingBridge framework.
/// To use this instance, we have to declare the interface myself.
@objc protocol ITermTabProtocol : ITermGenericMethodsProtocol {
	
	@objc(createWindowWithDefaultProfileCommand:) optional func createWindow(withDefaultProfileCommand command: String) -> SBObject
}

/// To downcast from `SBObject` instance to `ITermTabProtocol` instance,
/// to conform `SBObject` to `ITermTabProtocol'.
extension SBObject : ITermTabProtocol {
	
}
