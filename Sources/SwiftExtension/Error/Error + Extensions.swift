//
//  Error + Extensions.swift
//
//
//  Created by Святослав Спорыхин on 20.08.2024.
//

import Foundation

extension Error {
    public var urlError: URLError? {
        self as? URLError
    }
}
