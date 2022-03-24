//
//  ArrayExtension.swift
//  
//
//  Created by Святослав Спорыхин on 3/20/22.
//

import Foundation

extension Array {
	
	public subscript(
		safe index: Int
	) -> Element? {
		return count > index ? self[index] : nil
	}
}
