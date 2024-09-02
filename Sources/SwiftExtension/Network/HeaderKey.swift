//
//  HTTPHeader.swift
//
//
//  Created by Святослав Спорыхин on 20.08.2024.
//

import Foundation

/// Перечисление для представления различных HTTP-заголовков.
/// - Parameters:
///   - location: Локация ресурса
///   - contentType: Тип контента
///   - accept: Типы контента, которые клиент может принять
///   - authorization: Данные для авторизации
///   - cacheControl: Указания для кэширования
///   - contentLength: Длина содержимого
///   - contentEncoding: Кодировка содержимого
///   - eTag: Тег для управления версионностью ресурсов
///   - ifModifiedSince: Дата для проверки модификации ресурса
///   - userAgent: Информация о клиентском приложении
///   - xMonobrandID: Идентификатор для конкретного бренда
///   - customHeader: Пользовательский заголовок
public enum HTTPHeader {
    /// Локация ресурса
    case location(String)
    /// Тип контента
    case contentType(String)
    /// Типы контента, которые клиент может принять
    case accept(String)
    /// Данные для авторизации
    case authorization(String)
    /// Указания для кэширования
    case cacheControl(String)
    /// Длина содержимого
    case contentLength(String)
    /// Кодировка содержимого
    case contentEncoding(String)
    /// Тег для управления версионностью ресурсов
    case eTag(String)
    /// Дата для проверки модификации ресурса
    case ifModifiedSince(String)
    /// Информация о клиентском приложении
    case userAgent(String)
    /// Идентификатор для конкретного бренда
    case xMonobrandID(String)
    /// Пользовательский заголовок
    case customHeader(String, String)
    
    /// Инициализатор для создания HTTP-заголовка на основе ключа и значения.
    /// - Parameters:
    ///   - key: Ключ заголовка.
    ///   - value: Значение заголовка.
    init(
        key: String,
        value: String
    ) {
        switch key {
        case HTTPHeader.contentTypeKey:
            self = .contentType(value)
        case HTTPHeader.acceptKey:
            self = .accept(value)
        case HTTPHeader.authorizationKey:
            self = .authorization(value)
        case HTTPHeader.locationKey:
            self = .location(value)
        case HTTPHeader.cacheControlKey:
            self = .cacheControl(value)
        case HTTPHeader.contentLengthKey:
            self = .contentLength(value)
        case HTTPHeader.contentEncodingKey:
            self = .contentEncoding(value)
        case HTTPHeader.eTagKey:
            self = .eTag(value)
        case HTTPHeader.ifModifiedSinceKey:
            self = .ifModifiedSince(value)
        case HTTPHeader.userAgentKey:
            self = .userAgent(value)
        case HTTPHeader.xMonobrandIDKey:
            self = .xMonobrandID(value)
        default:
            self = .customHeader(key, value)
        }
    }
    
    /// Ключ заголовка HTTP.
    public var key: String {
        switch self {
        case .contentType:
            return HTTPHeader.contentTypeKey
        case .accept:
            return HTTPHeader.acceptKey
        case .authorization:
            return HTTPHeader.authorizationKey
        case .location:
            return HTTPHeader.locationKey
        case .cacheControl:
            return HTTPHeader.cacheControlKey
        case .contentLength:
            return HTTPHeader.contentLengthKey
        case .contentEncoding:
            return HTTPHeader.contentEncodingKey
        case .eTag:
            return HTTPHeader.eTagKey
        case .ifModifiedSince:
            return HTTPHeader.ifModifiedSinceKey
        case .userAgent:
            return HTTPHeader.userAgentKey
        case .xMonobrandID:
            return HTTPHeader.xMonobrandIDKey
        case .customHeader(let key, _):
            return key
        }
    }
    
    /// Значение заголовка HTTP.
    public var value: String {
        switch self {
        case .contentType(let value),
             .location(let value),
             .cacheControl(let value),
             .contentLength(let value),
             .contentEncoding(let value),
             .eTag(let value),
             .ifModifiedSince(let value),
             .userAgent(let value),
             .authorization(let value),
             .xMonobrandID(let value),
             .accept(let value):
            return value
        case .customHeader(_, let value):
            return value
        }
    }
}

extension HTTPHeader {
    /// Ключ для заголовка "Set-Cookie".
    static let cookieKey: String = "Set-Cookie"
    
    /// Ключ для заголовка "Content-Type".
    private static let contentTypeKey: String = "Content-Type"
    /// Ключ для заголовка "Accept".
    private static let acceptKey: String = "Accept"
    /// Ключ для заголовка "Authorization".
    private static let authorizationKey: String = "Authorization"
    /// Ключ для заголовка "Location".
    private static let locationKey: String = "location"
    /// Ключ для заголовка "Cache-Control".
    private static let cacheControlKey: String = "Cache-Control"
    /// Ключ для заголовка "Content-Length".
    private static let contentLengthKey: String = "Content-Length"
    /// Ключ для заголовка "Content-Encoding".
    private static let contentEncodingKey: String = "Content-Encoding"
    /// Ключ для заголовка "ETag".
    private static let eTagKey: String = "ETag"
    /// Ключ для заголовка "If-Modified-Since".
    private static let ifModifiedSinceKey: String = "If-Modified-Since"
    /// Ключ для заголовка "User-Agent".
    private static let userAgentKey: String = "User-Agent"
    /// Ключ для заголовка "x-monobrand-id".
    private static let xMonobrandIDKey: String = "x-monobrand-id"
}
