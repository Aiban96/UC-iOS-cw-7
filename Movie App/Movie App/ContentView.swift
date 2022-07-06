//
//  ContentView.swift
//  Movie App
//
//  Created by Abdullah Aiban on 06/07/2022.
//

import SwiftUI

struct MoviesStruct : Identifiable {
    
    var id = UUID()
    var movieName : String
    var MovieCast : [String]
    
}

struct ContentView: View {
    @State var moviesArray : [MoviesStruct] = [
        MoviesStruct(movieName: "Harry Potter",
                     MovieCast: ["Daniel Radcliffe", "Emma Watson", "Rupert Grint", "Voldemort", "Dumbledore"]),
        
        MoviesStruct(movieName: "Avengers",
                     MovieCast: ["IronMan", "Captain America", "Thor", "Thanos"]),
        
        MoviesStruct(movieName: "Se7en",
                     MovieCast: ["Brad Pitt", "Morgan Freeman", "John Doe"])
        
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                List(moviesArray, id: \.id){
                    movie in
                    NavigationLink {
                        SecondView(movie: movie)
                    } label: {
                        MovieView(movie: movie)
                        
                    }
                    
                }
            }
            .navigationTitle("Movies")
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MovieView: View {
    @State var movie : MoviesStruct
    var body: some View {
        HStack{
            Image(movie.movieName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(movie.movieName)
                .font(.system(size: 20))
                .padding()
        }
    }
}
