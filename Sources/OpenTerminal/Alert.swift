//
//  Alert.swift
//  OpenTerminal
//
//  Created by Tomohiro Kumagai on 7/5/18.
//  Copyright © 2018 EasyStyle G.K. All rights reserved.
//

import AppKit

func alert(message: String) {
	
	let alert = NSAlert()
	
	alert.messageText = message
	alert.runModal()
}
