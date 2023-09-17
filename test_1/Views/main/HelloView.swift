//
//  HelloView.swift
//  Амбассадор Москвы
//
//  Created by Никита on 15.09.2023.
//

import SwiftUI

struct HelloView: View {

    var body: some View {
        NavigationView{
            NavigationLink(destination: ViewMain()) {
                VStack {
                    HStack(alignment: .bottom){
                        Image("Герб").imageScale(.small)
                        Image("Твой город - твое дело").imageScale(.small)
                    }
                        Divider()
                        Spacer().frame(height: 100)
                        Text("Начать")
                            .font(.callout)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .lineLimit(10)
                            .padding(.top, 100.0)
                        }


                }.navigationTitle("Амбассадор Москвы")
                .navigationBarTitleDisplayMode(.inline)
//                .ignoresSafeArea(edges: .top)
            }
        }
    }

// второй экран
struct ViewMain: View {
    var body: some View {
            VStack{
                Spacer().frame(height: 150)
                Image("Карьерные сервисы").imageScale(.small)
                Spacer().frame(height: 400)
                Divider()
                Spacer().frame(height: 30)
                HStack {
                    Spacer().frame(height: 5)
                    NavigationLink(destination: ViewProfile()) {
                        Image("profile-user").imageScale(.small)
                    }
                    Spacer().frame(height: 5)
                    NavigationLink(destination: ViewQuests()) {
                        Image("to-do-list").imageScale(.small)
                    }
                    Spacer().frame(height: 5)
                    NavigationLink(destination: ViewStats()) {
                        Image("graph").imageScale(.small)
                    }
                    Spacer().frame(height: 5)
                    NavigationLink(destination: ViewSetting()) {
                        Image("setting").imageScale(.small)
                    }
                    Spacer().frame(height: 5)
                }
            }.navigationTitle("Меню")
    }
}

// третий экран
struct ViewProfile: View {
    var body: some View {
            Text("Профиль")
                .font(.title)
            Divider()
                .font(.title2)
            Image("Nikita").imageScale(.small).cornerRadius(500)
        EditButton()
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text("Фамилия")
                    .font(.body)
                    .fontWeight(.bold)
                Spacer()
                Text("Широкопетлев")
                    .font(.body)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Text("Имя")
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
                Text("Никита")
                    .font(.body)
                    .multilineTextAlignment(.trailing)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Text("Пол")
                    .font(.body)
                    .fontWeight(.bold)
                Spacer()
                Text("Мужской")
                    .font(.body)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Text("Дата рождения")
                    .font(.body)
                    .fontWeight(.bold)
                Spacer()
                Text("29.04.2000")
                    .font(.body)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Text("ВУЗ")
                    .font(.body)
                    .fontWeight(.bold)
                Spacer()
                Text("МГТУ им. Н.Э.Баумана")
                    .font(.body)
                Spacer()
            }
//            Spacer()
        }
//        Spacer().frame(height: 100)
        Divider()
        Spacer().frame(height: 30)
        HStack {
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewProfile()) {
                Image("profile-user").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewQuests()) {
                Image("to-do-list").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewStats()) {
                Image("graph").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewSetting()) {
                Image("setting").imageScale(.small)
            }
            Spacer().frame(height: 5)
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

// третий экран
struct ViewQuests: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredQuests: [Quest] {
        modelData.quests.filter { quest in
            (!showFavoritesOnly || quest.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Избранные")
                }
                ForEach(filteredQuests) { quest in
                    NavigationLink {
                        QuestDetail(quest: quest)
                    } label: {
                        QuestRow(quest: quest)
                    }
                }
            }.navigationTitle("Задания")
        }
        Divider()
        Spacer().frame(height: 30)
        HStack {
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewProfile()) {
                Image("profile-user").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewQuests()) {
                Image("to-do-list").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewStats()) {
                Image("graph").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewSetting()) {
                Image("setting").imageScale(.small)
            }
            Spacer().frame(height: 5)
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

// третий экран
struct ViewStats: View {
    var body: some View {
        ScrollView {
            Text("Поощрения")
                .font(.title)
            Divider()
            HStack{
                Spacer().frame(height: 5)
                VStack{
                    Image("gift_1").imageScale(.small).cornerRadius(20)
                    HStack{
                        Image("coin")
                        Text("5000")
                            .font(.subheadline)
                    }
                }
                VStack{
                    Image("gift_2").imageScale(.small).cornerRadius(20)
                    HStack{
                        Image("coin")
                        Text("7000")
                            .font(.subheadline)
                    }
                }
                Spacer().frame(height: 5)
            }
            HStack{
                Spacer().frame(height: 5)
                VStack{
                    Image("gift_3").imageScale(.small).cornerRadius(20)
                    HStack{
                        Image("coin")
                        Text("4000")
                            .font(.subheadline)
                    }
                }
                VStack{
                    Image("gift_4").imageScale(.small).cornerRadius(20)
                    HStack{
                        Image("coin")
                        Text("77777")
                            .font(.subheadline)
                    }
                }
                Spacer().frame(height: 5)
            }
        }
        Divider()
        Spacer().frame(height: 30)
        HStack {
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewProfile()) {
                Image("profile-user").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewQuests()) {
                Image("to-do-list").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewStats()) {
                Image("graph").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewSetting()) {
                Image("setting").imageScale(.small)
            }
            Spacer().frame(height: 5)
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

// третий экран
struct ViewSetting: View {
    var body: some View {
        ScrollView {
            Text("Настройки")
                .font(.title)
            Divider()
        }
        Divider()
        Spacer().frame(height: 30)
        HStack {
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewProfile()) {
                Image("profile-user").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewQuests()) {
                Image("to-do-list").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewStats()) {
                Image("graph").imageScale(.small)
            }
            Spacer().frame(height: 5)
            NavigationLink(destination: ViewSetting()) {
                Image("setting").imageScale(.small)
            }
            Spacer().frame(height: 5)
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}


struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
        ViewMain()
        ViewProfile()
        ViewQuests().environmentObject(ModelData())
        ViewStats()
        ViewSetting()
    }
}

