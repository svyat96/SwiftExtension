//
//  HTTPRequest.swift
//  
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

/// Протокол для реализации HTTP-запроса.
public protocol HTTPRequest {
    /// Тип данных, которые будут отправлены в теле запроса.
    associatedtype JSONBodyType: Encodable
    /// Тип модели, в которую должен быть декодирован успешный ответ.
    associatedtype SuccessModelType: Decodable
    /// Тип ошибки, которая может быть возвращена при неудачном запросе.
    associatedtype CustomError: Error & Decodable
    
    /// Тип для результата выполнения запроса, содержащий либо успешный ответ, либо ошибку.
    typealias RequestResult = Result<SuccessModelType, RequestError<CustomError>>
    /// Тип для замыкания, вызываемого при завершении запроса.
    typealias RequestCompletion = (RequestResult) -> Void
    
    /// Путь для выполнения запроса.
    static var path: APIPathProtocol { get }
    
    /// Тип HTTP-запроса: POST, GET, PUT, DELETE.
    static var requestType: HTTPMethod { get }
    
    /// Ключи заголовков, необходимые для выполнения запроса.
    static var headerKeys: [HTTPHeader] { get }
    
    /// Заголовки, преобразованные в формат, понятный для выполнения запроса.
    static var header: [String: String] { get }
    
    /// Выполняет HTTP-запрос с заданным телом и возвращает результат через замыкание.
    ///
    /// - Parameters:
    ///   - body: Модель тела запроса, содержащая данные для отправки.
    ///   - completion: Замыкание, вызываемое при завершении запроса, с результатом выполнения (успешный ответ или ошибка).
    /// - Returns: Таск `URLSessionDataTask` для выполнения запроса, который можно отменить.
    static func performRequest(
        body: BodyModel<JSONBodyType>,
        completion: @escaping RequestCompletion
    ) -> URLSessionDataTask?
    
    /// Декодирует данные ответа сервера в успешный результат или ошибку.
    ///
    /// - Parameter data: Сырые данные, полученные от сервера.
    /// - Returns: `RequestResult`, содержащий либо успешный ответ, либо ошибку.
    static func decodeResult(
        data: Data
    ) -> RequestResult
}
