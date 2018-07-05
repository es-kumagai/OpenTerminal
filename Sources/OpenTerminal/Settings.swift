//
//  Settings.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 7/5/18.
//  Copyright © 2018 EasyStyle G.K. All rights reserved.
//

import Foundation

let settings = Settings()

final class Settings {
	
	private let targetTerminalBundleIdentifierKey = "ESTargetTerminalBundleIdentifier"
	
	enum TargetTerminalBundleIdentifier : String {
		
		case appleTerminal = "com.apple.Finder"
		case iTerm2 = "com.googlecode.iterm2"
	}
	
	fileprivate init() {
		
		UserDefaults.standard.register(defaults: [
			
			targetTerminalBundleIdentifierKey : TargetTerminalBundleIdentifier.appleTerminal.rawValue
		])
	}
	
	var targetTerminalBundleIdentifier: TargetTerminalBundleIdentifier? {
		
		return UserDefaults.standard
			.string(forKey: targetTerminalBundleIdentifierKey)
			.map(TargetTerminalBundleIdentifier.init(rawValue:)) ?? nil
	}
	
	var terminal: Terminal? {
		
		switch settings.targetTerminalBundleIdentifier {
			
		case .appleTerminal?:
			return AppleTerminal()
			
		case .iTerm2?:
			return ITerm2()
			
		case nil:
			return nil
		}
	}
}
