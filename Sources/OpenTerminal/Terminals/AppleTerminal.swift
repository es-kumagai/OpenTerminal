//
//  AppleTerminal.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 7/5/18.
//  Copyright © 2018 EasyStyle G.K. All rights reserved.
//

import Foundation
import ScriptingBridge

final class AppleTerminal : Terminal {
	
	func open(url: URL) throws {
		
		let terminal = SBApplication(bundleIdentifier: "com.apple.Terminal")! as TerminalApplicationProtocol

		terminal.open!(with: [url.path])
		terminal.activate!()
	}
}
