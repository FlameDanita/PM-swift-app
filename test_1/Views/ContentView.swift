//
//  ContentView.swift
//  test_1
//
//  Created by Никита on 15.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HelloView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}

