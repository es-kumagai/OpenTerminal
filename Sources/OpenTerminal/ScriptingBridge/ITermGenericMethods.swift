//
//  ITermGenericMethods.swift
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
@objc protocol ITermGenericMethodsProtocol {
	
	@objc(delete) optional func delete()
	@objc(dupplicateTo:withProperties:) optional func dupplicate(to object: SBObject, withProperties: [String : Any])
	@objc(exists) optional func exists()
	@objc(moveTo:) optional func move(to object: SBObject)
	@objc(close) optional func close()
	@objc(createTabWithProfile:command:) optional func createTab(withProfile profile: String, command: String) -> ITermTabProtocol
	@objc(createTabWithDefaultProfileCommand:) optional func createTabWithDefaultProfile(command: String) -> ITermTabProtocol
	@objc(writeContentsOfFile:text:newline:) optional func writeContents(of: URL, text: String, newline: Bool)
	@objc(select) optional func select()
}

/// To downcast from `SBObject` instance to `ITermGenericMethodsProtocol` instance,
/// to conform `SBApplication` to `ITermGenericMethodsProtocol'.
extension SBObject : ITermGenericMethodsProtocol {
	
}

