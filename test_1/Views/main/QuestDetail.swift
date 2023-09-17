//
//  QuestDetail.swift
//  Поколение решений
//
//  Created by Никита on 16.09.2023.
//

import SwiftUI

struct QuestDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var quest: Quest
    
    var questIndex: Int {
        modelData.quests.firstIndex(where: { $0.id == quest.id })!
    }
    var body: some View {
        ScrollView {
            MapView(coordinate: quest.locationCoordinate)
                .frame(height:300)
            
            CircleImage(image: quest.image)
                .offset(y: -150)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(quest.name)
                        .font(.title)
                    .fontWeight(.black)
                    FavoriteButton(isSet: $modelData.quests[questIndex].isFavorite)
                }
                    
                HStack {
                    Text(quest.park)
                    Spacer()
                    Text(quest.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("\(quest.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(quest.description)
            }
            .padding()
        }
        .navigationTitle(quest.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        QuestDetail(quest: ModelData().quests[0])
            .environmentObject(modelData)
    }
}
