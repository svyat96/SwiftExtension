//
//  HTTPRequest + URLRequest.swift
//
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

extension HTTPRequest {
    
    /// Создает `URLRequest` на основе предоставленной модели `BodyModel`.
    ///
    /// Эта функция формирует `URLRequest` на основе переданного тела запроса, типа запроса, заголовков и пути.
    /// Обрабатывает опциональные query-параметры и устанавливает соответствующее тело запроса.
    ///
    /// - Parameter body: Модель тела запроса, которая будет включена в запрос. Может быть пустой или содержать данные/форму/query параметры.
    /// - Returns: `Result`, содержащий либо корректный `URLRequest`, либо `RequestError`, если URL недействителен.
    static func buildURLRequest(
        body: BodyModel<JSONBodyType>
    ) -> Result<URLRequest, RequestError<CustomError>> {
        guard let url = path.url else {
            return .failure(.programmaticError(.invalidURL))
        }
        
        let resolvedURL: URL = (body.isEmpty
            .getIf(
                true: .value(url),
                false: .func({
                    return URLComponents(
                        url: url,
                        resolvingAgainstBaseURL: true
                    )?.appendingQueryItemsForFormat(
                        result: body.outputResult
                    ).url
                })))
            .nonOptional(url)
        
        var request = URLRequest(url: resolvedURL)
        
        let header: [String: String] = [HTTPHeader](
            headerKeyGroups: [headerKeys])
            .toDictionary()
        request.allHTTPHeaderFields = header
        
        switch body.outputResult {
        case .json(let data), .form(let data), .jsonWithParameters(let data, _):
            request.httpBody = data
        case .queryParameters:
            break
        }
        request.httpMethod = requestType.rawValue
        
        return .success(request)
    }
    
    /// Преобразует ошибку в `RequestError<CustomError>`.
    ///
    /// Эта функция проверяет код ошибки, связанный с запросом. Если ошибка соответствует коду отмены запроса (-999),
    /// возвращается соответствующая ошибка отмены. В противном случае возвращается ошибка сервера.
    ///
    /// - Parameter err: Ошибка, возникшая во время выполнения запроса.
    /// - Returns: `RequestError<CustomError>`, соответствующий типу ошибки.
    static func decodeResult(
        from err: any Error
    ) -> RequestError<CustomError> {
        guard err.urlError?.code.rawValue == -999
        else {
            return .backend(.serverError(err))
        }
        return .backend(.cancelRequest)
    }
    
    /// Выполняет асинхронный HTTP-запрос с заданным телом и возвращает результат.
    ///
    /// Этот метод строит `URLRequest` на основе предоставленного тела запроса и выполняет его.
    /// После выполнения запроса результат декодируется и возвращается в виде `RequestResult`.
    ///
    /// - Parameter body: Модель тела запроса, содержащая данные для отправки.
    /// - Returns: Результат запроса, содержащий успешный ответ или ошибку.
    public static func performRequest(
        body: BodyModel<JSONBodyType>
    ) async -> RequestResult {
        switch buildURLRequest(body: body) {
        case .success(let request):
            do {
                let response: (data: Data, URLResponse) = try await URLSession.shared.data(for: request)
                return decodeResult(data: response.data)
            } catch let err {
                return .failure(decodeResult(from: err))
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
    /// Выполняет HTTP-запрос с заданным телом и возвращает результат через замыкание.
    ///
    /// Этот метод строит `URLRequest` на основе предоставленного тела запроса и выполняет его.
    /// После выполнения запроса результат декодируется и передается в замыкание `completion`.
    ///
    /// - Parameters:
    ///   - body: Модель тела запроса, содержащая данные для отправки.
    ///   - completion: Замыкание, которое вызывается с результатом запроса (успешный ответ или ошибка).
    /// - Returns: Таск `URLSessionDataTask` для выполнения запроса, который можно отменить.
    public static func performRequest(
        body: BodyModel<JSONBodyType>,
        completion: @escaping RequestCompletion
    ) -> URLSessionDataTask? {
        switch buildURLRequest(body: body) {
        case .success(let request):
            return URLSession
                .shared
                .dataTask(
                    with: request
                ) { data, response, error in
                    
                    if let err = error {
                        completion(.failure(decodeResult(
                            from: err)))
                    } else if let data = data {
                        completion(self.decodeResult(
                            data: data))
                    }
                    
                    completion(.failure(.programmaticError(.noDataAndNoError)))
                }
        case .failure(let error):
            completion(.failure(error))
            return nil
        }
    }
}
