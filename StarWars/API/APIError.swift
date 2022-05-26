//
//  APIError.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
