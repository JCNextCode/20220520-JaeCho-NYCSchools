//
//  ColorTheme.swift
//  20220520-JaeCho-NYCSchools
//
//  Created by Jae Cho on 5/23/22.
//

import Foundation
import SwiftUI

// Defining custom background and colors.
extension ShapeStyle where Self == Color {
	static var darkBackground: Color {
		Color(red: 0.1, green: 0.1, blue: 0.2)
	}
	static var lightBackground: Color {
		Color(red: 0.2, green: 0.2, blue: 0.3)
	}
}
