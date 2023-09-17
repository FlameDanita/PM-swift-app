//
//  Person.swift
//  Амбассадор Москвы
//
//  Created by Никита on 16.09.2023.
//

import SwiftUI

struct PersonView: View {
    var body: some View {
        VStack{
//            Text("dsdsd").frame(height:500)
            Spacer().frame(height: 750)
            Divider()
            Spacer().frame(height: 30)
            HStack {
                Spacer().frame(height: 5)
                Image("profile-user").imageScale(.small)
                Spacer().frame(height: 5)
                Image("to-do-list").imageScale(.small)
                Spacer().frame(height: 5)
                Image("graph").imageScale(.small)
                Spacer().frame(height: 5)
                Image("setting").imageScale(.small)
                Spacer().frame(height: 5)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
