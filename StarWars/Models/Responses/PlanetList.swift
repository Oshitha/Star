//
//  PlanetList.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation

// MARK: - PlanetListResponse
struct PlanetList: Codable {
    let results: [PlanetListItem]
}

// MARK: - Result
struct PlanetListItem: Codable,Identifiable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String
    //let id:Int?
    var thumbImg:String?

    let id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url, id,thumbImg
    }
}
