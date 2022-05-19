//
//  Icon.swift
//  OpenTerminal
//  
//  Created by Tomohiro Kumagai on 2022/05/20
//  Copyright © 2022 EasyStyle G.K. All rights reserved.
//

import AppKit

func updateAppIcon() {

	let buildVersion = AppInfo.buildVersion
	
	guard buildVersion != AppInfo.lastLaunchedBuildVersion else {
		
		return
	}
	
	if NSWorkspace.shared.setIcon(AppInfo.effectiveAppIcon, forFile: AppInfo.bundlePath) {
		
		AppInfo.lastLaunchedBuildVersion = buildVersion
	}
}
