//
//  AppError.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded."
        case .unknownError:
            return "Bruuhh!! I have no idea what go on"
        case .invalidUrl:
            return "HEEEYY!! Give me a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
