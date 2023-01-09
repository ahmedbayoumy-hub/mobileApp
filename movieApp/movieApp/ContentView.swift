//
//  ContentView.swift
//  movieApp
//
//  Created by Consultant on 1/6/23.
//

import SwiftUI

//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct Result: Codable, Hashable {
    let title: String
    let overview: String
    let release_date: String
    let vote_average: Double
    let poster_path: String
    let id : Int
}

struct Movie: Codable, Hashable {
    let results: [Result]
}



struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack {
            NavigationView {
                List {
                    ForEach (viewModel.movies.results, id: \.id) { movie in
                        HStack {
                            
                            
//                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movie.results.first?.poster_path ?? "")")).frame(width: 60, height: 80).scaledToFit()

//                            Image("https://image.tmdb.org/t/p/original/\(movie.results.first?.poster_path ?? "")")
//                                .frame(width: 60, height: 80)
//
                            
                            NavigationLink(movie.title, destination: MovieDetailView(viewModel.idToResultDic[movie.id]!))
                        }
                    }
                }
                .navigationTitle("Top Movies")
                .onAppear {
                    viewModel.fetch()
                }
            }
            
        }
        .padding()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
