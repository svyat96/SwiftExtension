//
//  HTTPMethod.swift
//
//
//  Created by Святослав Спорыхин on 20.08.2024.
//

import Foundation

///Виды запросов
public enum HTTPMethod: String {
    ///POST
    case post = "POST"
    ///GET
    case get = "GET"
    ///PUT
    case put = "PUT"
    ///DELETE
    case delete = "DELETE"
}
