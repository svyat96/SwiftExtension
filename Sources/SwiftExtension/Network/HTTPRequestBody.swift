//
//  HTTPRequestBody.swift
//
//
//  Created by Святослав Спорыхин on 20.08.2024.
//

import Foundation

/// Протокол для большинства BODY
public protocol HTTPRequestBody: Encodable {
    ///QueryItems используем в GET запросах
    var queryParameters: [URLQueryItem] { get }
    ///Нужен для некоторых запросов, есть расширение для преобразования queryItems в form
    var urlEncodedForm: String { get }
    /// Нужен, для запросов, где используется и json и queryItems. Сюда передаётся объект, необходимый для отправки в body json типа
    var jsonBody: any Encodable { get }
}

extension HTTPRequestBody {
    ///QueryItem для GET запроса
    public var queryParameters: [URLQueryItem] { [] }
    ///Строка для FORM запроса
    public var urlEncodedForm: String { .empty }
    /// Строка для запросов JSON + QueryItems
    public var jsonBody: any Encodable { self }
}

///Модель для упаковки body данных
public struct BodyModel<T: Encodable> {
    ///Возвращаемый body результат
    public let outputResult: HTTPRequestBodyFormat
    ///Конфигурация body результата
    public let inputResult: HTTPRequestPayload<T>
    ///Пустой ли Body
    public var isEmpty: Bool {
        switch outputResult {
        case .json(let data), .form(let data):
            return data.isEmpty
        case .queryParameters(let array):
            return array.isEmpty
        case .jsonWithParameters(let data, let array):
            return data.isEmpty.and(array.isEmpty)
        }
    }
    
    private init(
        _ inputResult: HTTPRequestPayload<T>
    ) {
        self.inputResult = inputResult
        switch self.inputResult {
        case .json(let value):
            let data: Data? = try? JSONEncoder().encode(value)
            outputResult = .json(data.nonOptional(Data()))
        case .form(let value):
            let data = value.urlEncodedForm
                .data(using: .utf8)
                .nonOptional(Data())
            
            outputResult = .form(data)
        case .queryParameters(let value):
            outputResult = .queryParameters(value.queryParameters)
        case .jsonWithParameters(let value):
            let dataJson: Encodable = value.jsonBody
            let data: Data? = try? JSONEncoder().encode(dataJson)
            outputResult = .jsonWithParameters(
                data.nonOptional(Data()),
                value.queryParameters)
        }
    }
}

extension BodyModel where T == EmptyModel {
    ///Если Body может быть пустой моделью то создаем значение по умолчанию
    public static let empty = BodyModel(.queryParameters(EmptyModel()))
}

extension BodyModel where T: HTTPRequestBody {
    
    /// BodyModel с данными для отправки по FORM
    /// - Parameter form: JSONBodyType
    /// - Returns: BodyModel<.form(JSONBodyType)>
    public static func withForm(
        _ form: T
    ) -> BodyModel<T> {
        return .init(.form(form))
    }
    
    /// BodyModel с данными для отправки по QueryItems
    /// - Parameter queryItems: JSONBodyType
    /// - Returns: BodyModel<.queryItems(JSONBodyType)>
    public static func withQueryParameters(
        _ queryParameters: T
    ) -> BodyModel<T> {
        return .init(.queryParameters(queryParameters))
    }

    /// BodyModel с данными для отправки по QueryItems + JSON
    /// - Parameter jsonWithQueryItems: JSONBodyType
    /// - Returns: BodyModel<.jsonWithQueryItems(JSONBodyType)>
    public static func withJSONAndParameters(
        _ jsonWithParameters: T
    ) -> BodyModel<T> {
        return .init(.jsonWithParameters(jsonWithParameters))
    }
}

extension BodyModel {

    /// BodyModel с данными для отправки по JSON
    /// - Parameter json: JSONBodyType
    /// - Returns: BodyModel<.json(JSONBodyType)>
    public static func withJSON(
       _ json: T
    ) -> BodyModel<T> {
        return .init(.json(json))
    }
}

/// Тип Body с возвращаемым значением
public enum HTTPRequestBodyFormat {
    ///В httpBody кладется Data
    case json(Data)
    ///В httpBody кладется Data
    case form(Data)
    ///Путь запроса + QueryItems
    case queryParameters([URLQueryItem])
    /// Путь запроса с QueryItems + в httpBody кладется Data
    case jsonWithParameters(Data, [URLQueryItem])
}

/// Тип Body с принимаемым значением
public enum HTTPRequestPayload<T: Encodable> {
    ///Хранит модель которую нужно будет отправить как JSON
    case json(T)
    ///Хранит модель которую нужно будет отправить как FORM
    case form(HTTPRequestBody)
    ///Хранит модель которую нужно будет отправить как QueryItems
    case queryParameters(HTTPRequestBody)
    /// Хранит модель которую нужно будет отправить как JSON и как QueryItems
    case jsonWithParameters(HTTPRequestBody)
}
