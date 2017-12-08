//
//  FinderItem.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 12/4/17.
//  Copyright © 2017 EasyStyle G.K. All rights reserved.
//

import ScriptingBridge

/// Interface definition for `FinderItem` class.
///
/// Natively, `FinderItem` class is inherit `SBObject` class.
/// In Swift, to use `FinderItem` class, we need to downcast from `SBObject` instance to this class's.
@objc protocol FinderItemProtocol {
	
	/// The URL of the item.
	@objc(URL) optional var url: String { get }
}

/// This extension is to be able to upcast `SBObject` instance to `FinderItem` instance.
extension SBObject : FinderItemProtocol {
	
}

