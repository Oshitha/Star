//
//  PlanetsService.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation
import Combine

protocol PlanetsService {
    var apiSession: APIService {get}
    
    func getPlanetList() -> AnyPublisher<PlanetList, Error>
    func getPlanetDetails(url:String) -> AnyPublisher<PlanetDetails, Error>
}

extension PlanetsService {
    
    func getPlanetList() -> AnyPublisher<PlanetList, Error> {
        return apiSession.request(with: PlanetsEndPoint.planetList)
            .eraseToAnyPublisher()
    }
    
    func getPlanetDetails(url:String) -> AnyPublisher<PlanetDetails, Error> {
        return apiSession.request(with: PlanetsEndPoint.planetDetails(url))
            .eraseToAnyPublisher()
    }
}
