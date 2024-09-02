//
//  APIPathProtocol.swift
//
//
//  Created by Святослав Спорыхин on 20.08.2024.
//

import Foundation

///Протокол для стандартизации работы с компонентами связанными с путями API
public protocol APIPathProtocol {
    ///Значение пути, иногда пересекается с rawValue из RawRepresentable
    var rawValue: String { get }
    
    ///Возвращает главный путь к которому добавляются разветления
    var basePath: String { get }
    
    ///Путь преобразованный в URL
    var url: URL? { get }
}
