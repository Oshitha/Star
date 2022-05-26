//
//  DetailViewModel.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation
import Combine

class DetailViewModel :ObservableObject,PlanetsService{
   
    @Published private(set) var state = State.idle
    @Published var planetDetails:PlanetDetails?
    
    var apiSession: APIService
    var cancellables = Set<AnyCancellable>()
    var planetListItem:PlanetListItem?
    
    init(planetListItem: PlanetListItem,apiSession: APIService = APISession()){
        self.apiSession = apiSession
        self.planetListItem = planetListItem
    }
    
    
    func getPlanetDetails() {
        state = .loading
        
        let cancellable = self.getPlanetDetails(url: planetListItem?.url ?? "")
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    self.state = .failed(error)
                    print("Handle error: \(error)")
                case .finished:
                    self.state = .loaded
                }

            }) { (planetsDetails) in
                self.planetDetails = planetsDetails
        }
        cancellables.insert(cancellable)
    }
}

