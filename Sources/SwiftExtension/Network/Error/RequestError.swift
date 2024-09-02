//
//  RequestError.swift
//  
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

///Виды ошибок на проекте
public enum RequestError<T: Error>: Error {
    ///Упаковываем ошибки программные(в результате выполнения кода)
    case programmaticError(ProgrammaticError)
    ///Упаковываем ошибки с сервера
    case backend(BackendError)
    ///Кастомные ошибки нужные в частном случае
    case customError(T)
    
    ///Локализовываем ошибки
    var localizedDescription: String {
        switch self {
        case .programmaticError(let programmaticError):
            return programmaticError.localizedDescription
        case .backend(let error):
            return error.localizedDescription
        case .customError(let err):
            return err.localizedDescription
        }
    }
}

extension RequestError {
    ///Ошибки программные(в результате выполнения кода)
    public enum ProgrammaticError: Error {
        ///Не валидный передан путь к запросу
        case invalidURL
        ///Ошибка парсинга SuccessModel
        case parsingError(Error)
        ///Ответ с сервера отсутствует и ошибка отсутствует
        case noDataAndNoError
        
        ///Локализовываем ошибки
        var localizedDescription: String {
            switch self {
            case .invalidURL:
                return "При попытке создать запрос, url оказался не валидным!"
            case .parsingError(let error):
                return "Ошибка декодирования: \(error.localizedDescription)"
            case .noDataAndNoError:
                return "Ошибка запроса отсутствует и данные отсутствуют!"
            }
        }
    }
    
    ///Ошибки с сервера
    public enum BackendError: Error {
        ///Ошибка с сервера(без описания проблемы)
        case requestFailed
        ///Ошибка с сервера(с описанием проблемы)
        case serverError(Error)
        ///Ошибка с сервера при отмене запроса
        case cancelRequest
        
        init(
            error: Error
        ) {
            self = .serverError(error)
        }
    }
}
