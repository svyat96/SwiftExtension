//
//  HTTPRequest + NonEmptyModel.swift
//
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

extension HTTPRequest where SuccessModelType: NonEmptyProtocol {
    /// Декодирует результат HTTP-запроса, возвращая модель данных в случае успеха или ошибку в случае неудачи.
    ///
    /// Этот метод используется, когда ожидается, что результат запроса не является пустым.
    /// Если декодирование данных как `SuccessModelType` не удается, метод вызывает обработку ошибки.
    ///
    /// - Parameter data: Данные, полученные от сервера.
    /// - Returns: Результат декодирования, содержащий либо успешную модель, либо ошибку.
    public static func decodeResult(
        data: Data
    ) -> RequestResult {
        do {
            let successModel = try JSONDecoder().decode(SuccessModelType.self, from: data)
            return .success(successModel)
        } catch {
            return .failure(decodeError(data: data, decodingError: error))
        }
    }

    /// Обрабатывает ошибку декодирования, пытаясь декодировать `CustomError`.
    ///
    /// Этот метод используется для обработки ошибок, возникающих при декодировании ответа.
    /// Если декодирование ошибки как `CustomError` не удается, возвращает общую ошибку запроса.
    ///
    /// - Parameters:
    ///   - data: Данные, полученные от сервера.
    ///   - decodeErr: Ошибка, возникшая при декодировании `SuccessModelType`.
    /// - Returns: `RequestError<CustomError>`, содержащий либо декодированную ошибку, либо общую ошибку запроса.
    private static func decodeError(
        data: Data,
        decodingError: Error
    ) -> RequestError<CustomError> {
        guard let err = try? JSONDecoder().decode(CustomError.self, from: data) else {
            return .backend(.requestFailed)
        }
        
        return .customError(err)
    }
}
