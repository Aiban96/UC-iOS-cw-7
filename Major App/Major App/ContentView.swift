//
//  ContentView.swift
//  Major App
//
//  Created by Abdullah Aiban on 07/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var toggleMajor = false
    @State var majors = ["Computer Engineering", "Computer Science", "Other Major"]
    @State var selectedMajor = ""
    var body: some View {
        VStack{
            Spacer()
            HStack{
                
                Text("Choose your major")
                    .bold()
                    .font(.system(size: 30))
                Image(systemName: toggleMajor ? "minus" : "plus")
                    .font(.title)
                    .onTapGesture {
                        toggleMajor.toggle()
                    }
            }
            Spacer()
            if toggleMajor {
                
                VStack{
                    ForEach(majors, id: \.self) { major in
                        Text(major)
                            .onTapGesture {
                                selectedMajor = major
                            }
                            .frame(width: 250, height: 50)
                            .padding()
                            .foregroundColor(.white)
                            .background(selectedMajor == major ? Color.red : Color.blue)
                            .cornerRadius(30)
                            
                    }
                }
                
            }
            Spacer()
            Text("Your major is \(selectedMajor)")
                .font(.system(size: 20))
                .bold()
                .padding()
        }
        .animation(.easeInOut(duration: 0.3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
