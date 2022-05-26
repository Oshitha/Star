//
//  ContentView.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationView {
            switch viewModel.state {
            case .idle:
                Color.clear.onAppear(perform: viewModel.getPlanetList)
            case .loading:
                ProgressView()
            case .failed(let error):
                VStack {
                    Text(error.localizedDescription)
                }
            case .loaded:
                
                List(self.viewModel.planetsList.indices, id: \.self) { index in 
                    NavigationLink(
                         destination:
                            DetailView(planetListItem: self.viewModel.planetsList[index]),
                         label: {
                             PlantItems(
                                planet: self.viewModel.planetsList[index])
                         }
                     )
                   }
                
                /*List(self.viewModel.planetsList) { planet in
                   NavigationLink(
                        destination: DetailView(planetListItem: planet),
                        label: { PlantItems(planet: planet) }
                    )
                }*/
                .navigationBarTitle("Star Wars")
            }
               
        }
        
    }
    
    private struct PlantItems:View{
        
        let planet: PlanetListItem
        
        var body: some View {
            HStack{
                AsyncImage(url: URL(string: planet.thumbImg ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(planet.name)
                        .font(.title)
                        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                    Text(planet.climate)
                        .font(.title2)
                        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
