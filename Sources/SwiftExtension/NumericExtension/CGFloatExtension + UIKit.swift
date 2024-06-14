//
//  CGFloatExtension + UIKit.swift
//
//
//  Created by Svyatoslav Sporykhin on 7/27/23.
//

import UIKit

extension CGFloat {
    /**
     The width of the main screen.
     
     - Returns: The width of the main screen.
     */
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /**
     The height of the main screen.
     
     - Returns: The height of the main screen.
     */
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}
