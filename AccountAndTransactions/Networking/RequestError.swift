//
//  RequestError.swift
//  AccountAndTransactions
//
//  Created by Rakshith on 12/6/22.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Error while decoding"
        case .unauthorized:
            return "Session expired"
        case .noResponse:
            return "There was no response from the server"
        default:
            return "Unknown error"
        }
    }
}
