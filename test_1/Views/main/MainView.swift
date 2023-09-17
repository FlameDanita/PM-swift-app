//
//  main.swift
//  Амбассадор Москвы
//
//  Created by Никита on 15.09.2023.
//

import SwiftUI

struct ResultView: View {
    var choice: String

    var body: some View {
        Text("You chose \(choice)")
    }
}


struct MainView: View {
    var body: some View {
        NavigationView {
            VStack{
                //            Text("dsdsd").frame(height:500)
                Spacer().frame(height: 150)
                Image("Карьерные сервисы").imageScale(.small)
                Spacer().frame(height: 400)
                
                //            NavigationView {
                //                VStack(spacing: 30) {
                //                    Text("You're going to flip a coin – do you want to choose heads or tails?")
                //
                //                    NavigationLink(destination: ResultView(choice: "Heads")) {
                //                        Text("Choose Heads")
                //                    }
                //
                //                    NavigationLink(destination: ResultView(choice: "Tails")) {
                //                        Text("Choose Tails")
                //                    }
                //                }
                //                .navigationTitle("Navigation")
                //            }
                
                Divider()
                Spacer().frame(height: 30)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
