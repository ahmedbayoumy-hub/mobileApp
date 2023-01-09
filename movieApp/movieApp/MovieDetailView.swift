//
//  MovieDetails.swift
//  movieApp
//
//  Created by Consultant on 1/8/23.
//

import Foundation
import SwiftUI



struct MovieDetailView: View {
    //@StateObject var viewModel = ViewModel()
    
    let movieResult: Result
    
    init(_ movieInfo: Result)
    {
        movieResult = movieInfo
    }
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movieResult.poster_path)"))
                                        {
                                            image in image.resizable()
                                        } placeholder: {
                                            Color.gray
                                        }
                                            .frame(width: 200, height: 240)
            Text ("Movie Title:" )
                .padding(.bottom, 5)
                .bold()
                .font(.title3)
            Text(movieResult.title)
                .bold()
                .font(.title3)
                .padding(.bottom, 20)
            Text ("Movie Description:")
                .padding(.bottom, 10)
                .bold()
            Text (movieResult.overview)
                .padding(.bottom, 10)
            Text ("Release Date: \(movieResult.release_date)")
                .padding(.bottom, 10)
            Text ("Movie Rating: \(movieResult.vote_average)")
        } .lineSpacing(6)
            /*
            .onAppear {
                viewModel.fetch()
            }
            .padding(3)*/
    }

    /*
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            MovieDetailView()
        }
    }
     */
}

