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
@objc protocol ITermApplicationProtocol : FinderApplicationProtocol {

	@objc optional var currentWindow: ITermWindowProtocol { get set }
	@objc optional var name: String { get set }
	@objc optional var frontmost: Bool { get }
	@objc optional var version: String { get }
	
	@objc(createWindowWithDefaultProfileCommand:) optional func createWindow(withDefaultProfileCommand command: String) -> ITermWindowProtocol
}

/// To downcast from `SBApplication` instance to `TerminalApplicationProtocol` instance,
/// to conform `SBApplication` to `TerminalApplicationProtocol'.
extension SBApplication : ITermApplicationProtocol {
	
}

