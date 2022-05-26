//
//  PlanetsEndPoint.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation

// MARK: services
enum services :String{
    case planets = "planets/"
}

// MARK: Network Environment enum
enum NetworkEnvironment {
    case dev
    case production
    case stage
}
enum PlanetsEndPoint {
    case planetList
    case planetDetails(String)
}

extension PlanetsEndPoint: RequestBuilder {
    
    var service: String {
        switch self {
        case .planetList:
            return services.planets.rawValue
        case .planetDetails(_):
            return ""
        }
        
    }
    var baseUrl: String {
        switch self {
        case .planetList:
            return APP_URL.DEV
        case .planetDetails(let string):
            return string
        }
        
    }
}
