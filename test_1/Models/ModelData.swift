//
//  ModelData.swift
//  Поколение решений
//
//  Created by Никита on 16.09.2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var quests: [Quest] = load("questdata.json")
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
