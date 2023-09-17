//
//  test_1App.swift
//  test_1
//
//  Created by Никита on 15.09.2023.
//

import SwiftUI

@main
struct test_1App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
