//
//  Icon.swift
//  OpenTerminal
//  
//  Created by Tomohiro Kumagai on 2022/05/20
//  Copyright © 2022 EasyStyle G.K. All rights reserved.
//

import AppKit

func updateAppIcon() {
	
	let icon = NSImage(named: "EffectiveAppIcon")!
	let path = Bundle.main.bundlePath

	NSWorkspace.shared.setIcon(icon, forFile: path)
}
