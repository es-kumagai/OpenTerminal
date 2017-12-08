//
//  TerminalApplication.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 12/4/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

/// Interface definition for `TerminalApplication` class.
///
/// This interface is used for controll `Terminal` application through ScriptingBridge framework.
/// To use this instance, we have to declare the interface myself.
@objc protocol TerminalApplicationProtocol : FinderApplicationProtocol {

	@objc(open:) optional func open(with arguments: Array<String>)
}

/// To downcast from `SBApplication` instance to `TerminalApplicationProtocol` instance,
/// to conform `SBApplication` to `TerminalApplicationProtocol'.
extension SBApplication : TerminalApplicationProtocol {
	
}

