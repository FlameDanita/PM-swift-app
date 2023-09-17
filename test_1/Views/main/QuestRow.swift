//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Arav Patel on 3/7/23.
//

import SwiftUI

struct QuestRow: View {
    
    var quest: Quest
    
    var body: some View {
        HStack {
            quest.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(quest.name)
            
            Spacer()
            
            if quest.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct QuestRow_Previews: PreviewProvider {
    
    static var quests = ModelData().quests
    static var previews: some View {
        Group {
            QuestRow(quest: quests[0])
            QuestRow(quest: quests[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
