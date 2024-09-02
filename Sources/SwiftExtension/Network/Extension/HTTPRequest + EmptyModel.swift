//
//  HTTPRequest + EmptyModel.swift
//
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

extension HTTPRequest where JSONBodyType == EmptyModel {
    /// Выполняет HTTP-запрос с пустым телом и передает результат через замыкание.
    ///
    /// Этот метод упрощает выполнение запроса, когда тело запроса не требуется (например, для `GET` запросов).
    /// Запрос выполняется с пустым телом, а результат передается в замыкание `completion`.
    ///
    /// - Parameter completion: Замыкание, вызываемое при завершении запроса, содержащее результат (успех или ошибка).
    /// - Returns: Таск `URLSessionDataTask`, который можно использовать для управления запросом, например, для его отмены.
    public static func performRequest(
        completion: @escaping (Result<SuccessModelType, RequestError<CustomError>>) -> Void
    ) -> URLSessionDataTask? {
        return performRequest(
            body: .empty,
            completion: completion)
    }
}

extension HTTPRequest where SuccessModelType == EmptyModel {
    /// Декодирует результат HTTP-запроса, возвращая успех или ошибку.
    ///
    /// Этот метод используется, когда ожидаемый результат запроса — пустая модель.
    /// Если декодирование данных как `SuccessModelType` не удается, пытается декодировать ошибку.
    ///
    /// - Parameter data: Данные, полученные от сервера.
    /// - Returns: Результат декодирования, содержащий либо пустую модель в случае успеха, либо ошибку.
    public static func decodeResult(
        data: Data
    ) -> RequestResult {
        guard let success = try? JSONDecoder().decode(SuccessModelType.self, from: data) else {
            if let errorData = try? JSONDecoder().decode(CustomError.self, from: data) {
                return .failure(.customError(errorData))
            } else {
                return .failure(.backend(.requestFailed))
            }
        }

        return .success(success)
    }
}
