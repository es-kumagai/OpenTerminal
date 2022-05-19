//
//  AppInfo.swift
//  OpenTerminal
//  
//  Created by Tomohiro Kumagai on 2022/05/20
//  Copyright © 2022 EasyStyle G.K. All rights reserved.
//

import AppKit

struct AppInfo {
	
	private static let buildVersionKey = "CFBundleVersion"
	private static let lastLaunchedBuildVersionKey = "LastLaunchedBuildVersion"
	
	static var buildVersion: Int {
		
		guard let rawVersion = Bundle.main.object(forInfoDictionaryKey: buildVersionKey) as? String else {
			
			fatalError("Failed to get current build version.")
		}
		
		guard let version = Int(rawVersion, radix: 10) else {
			
			fatalError("Invalid build version: \(rawVersion)")
		}
		
		return version
	}
	
	static var lastLaunchedBuildVersion: Int {
		
		get {
			
			UserDefaults.standard.integer(forKey: lastLaunchedBuildVersionKey)
		}
		
		set (version) {
			
			UserDefaults.standard.set(version, forKey: lastLaunchedBuildVersionKey)
		}
	}
	
	static var effectiveAppIcon: NSImage {
		
		NSImage(named: "EffectiveAppIcon")!
	}
	
	static var bundlePath: String {
		
		Bundle.main.bundlePath
	}
}
