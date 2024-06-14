//
//  CustomDescription.swift
//
//
//  Created by Svyatoslav Sporykhin on 3/20/22.
//

import Foundation

/**
 A protocol that defines a custom description property.
 */
public protocol CustomDescription {
    /**
     A custom string description for the conforming type.
     */
    var customDescription: String { get }
}
