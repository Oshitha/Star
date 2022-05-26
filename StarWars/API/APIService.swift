//
//  APIService.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation
import Combine

protocol APIService {
    
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, Error>
}

