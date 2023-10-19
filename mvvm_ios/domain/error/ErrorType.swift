//
//  ErrorType.swift
//  mvvm_ios
//
//  Created by Roberto García Romero on 14/10/23.
//

import Foundation

enum ErrorType: Error {
    case httpError(HttpError)
    case unknownError(UnknownError)
    case parseError
    case timeOutError
    case unknownHostException
    case unknownNetworkError
}

struct HttpError{let code: Int}

struct UnknownError{let error: String}

extension ErrorType {
    func getString() -> String {
        switch self {
        case .httpError(let httpError): return "Error \(httpError.code)"
        case .unknownError(let unkownError): return "Error desconocido: \(unkownError.error)"
        case .parseError: return "Error parseando los datos"
        case .timeOutError: return "Time out"
        case .unknownHostException: return "Host desconocido"
        case .unknownNetworkError: return "Error de red desconocido"
        }
    }
}

