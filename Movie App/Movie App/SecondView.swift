//
//  SecondView.swift
//  Movie App
//
//  Created by Abdullah Aiban on 06/07/2022.
//

import SwiftUI

struct SecondView: View {
    
    @State var movie : MoviesStruct
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .background(Image(movie.movieName)
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 40)
                            
                )
                .ignoresSafeArea()
            
            VStack{
                Image(movie.movieName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                    .clipShape(Circle())
                Text(movie.movieName)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .bold()
                
                ScrollView(.horizontal,showsIndicators: true){
                    HStack{
                        ForEach(movie.MovieCast, id: \.self) { cast in
                            VStack {
                                Image(cast)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                
                                Text(cast)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(movie: MoviesStruct(movieName: "Harry Potter", MovieCast: ["Daniel Radcliffe"]))
    }
}
