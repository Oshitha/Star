//
//  HomeViewModel.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation
import Combine

enum State {
    case idle
    case loading
    case failed(Error)
    case loaded
}

class HomeViewModel :ObservableObject,PlanetsService{
    
    @Published private(set) var state = State.idle
    
    var apiSession: APIService
    var cancellables = Set<AnyCancellable>()
    
    @Published var planetsList = [PlanetListItem]()
   
    
    init(apiSession: APIService = APISession()){
        self.apiSession = apiSession
    }
    
    func getPlanetList() {
        state = .loading
        
        let cancellable = self.getPlanetList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    self.state = .failed(error)
                    print("Handle error: \(error)")
                case .finished:
                    self.state = .loaded
                }
                
            }) { (planets) in
                self.planetsList = self.updatePlanetList(planets: planets)
              
            }
        cancellables.insert(cancellable)
    }
    
    private func updatePlanetList(planets:PlanetList) -> [PlanetListItem] {
        var planetsList = [PlanetListItem]()
        
        planetsList = planets.results.enumerated().map { (index,item: PlanetListItem) -> PlanetListItem in
          var mutableListItem = item
            mutableListItem.thumbImg = IMAGE_URL.IMAGE_LOADING_URL.appending(String(index))
          return mutableListItem
        }
        
        return planetsList
    }

}
