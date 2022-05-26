//
//  APISession.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation
import Combine
import Alamofire

class APISession : APIService{
    
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, Error> where T : Decodable {
        
        print("URL",builder.baseUrl + builder.service)
        return AF.request(builder.baseUrl + builder.service, method: .get)
            .publishDecodable(type: T.self)
            .tryCompactMap { (response) -> T? in
                if let error = response.error { throw error }
                return response.value
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
