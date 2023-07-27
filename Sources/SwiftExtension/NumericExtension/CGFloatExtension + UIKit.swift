//
//  CGFloatExtension + UIKit.swift
//  
//
//  Created by Святослав Спорыхин on 7/27/23.
//

import UIKit

extension CGFloat {
	/// Ширина главного экрана
	public static var screenWidth: CGFloat {
		return UIScreen.main.bounds.width
	}
	
	/// Высота главного экрана
	public static var screenHeight: CGFloat {
		return UIScreen.main.bounds.height
	}
}
