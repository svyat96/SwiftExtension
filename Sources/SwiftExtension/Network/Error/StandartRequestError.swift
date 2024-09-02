//
//  StandartRequestError.swift
//
//
//  Created by Святослав Спорыхин on 20.08.2024.
//

import Foundation

public enum EmptyCustomError: Error {}
public typealias StandardRequestError = RequestError<EmptyCustomError>
