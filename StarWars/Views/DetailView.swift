//
//  DetailView.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    init(planetListItem: PlanetListItem) {
        viewModel = DetailViewModel(planetListItem: planetListItem)
    }
    
    var body: some View {
        
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear(perform: viewModel.getPlanetDetails)
        case .loading:
            ProgressView()
        case .failed(let error):
            VStack {
                Text(error.localizedDescription)
            }
        case .loaded:
            planetDetails(planetDetails: viewModel.planetDetails!)
        }
    }
    
    private func planetDetails(planetDetails: PlanetDetails) -> some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: viewModel.planetListItem?.thumbImg ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                Text(planetDetails.name)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Text(planetDetails.orbitalPeriod)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Text(planetDetails.gravity)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            }
        }
    }
    
}
