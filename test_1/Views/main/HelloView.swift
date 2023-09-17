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
                        .font(.title2)
                        .fontWeight(.regular)
                        .foregroundColor(Color.pink)
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
                ScrollView{
                    Spacer().frame(height: 30)
                    HStack{
                        Text("Новости")
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 20.0)
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        Image("Интерн-пикник").imageScale(.small).cornerRadius(15)
                        HStack{
                            Text("Прошло главное молодежное карьерное")
                                .padding(.leading, 20.0)
                            Spacer()
                        }
                        HStack{
                            Text("мероприятие этого года — Интерн пикник!")
                                .padding(.leading, 20.0)
                            Spacer()
                        }
                        Text("14 дней назад")
                            .font(.subheadline)
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        Image("Форум").imageScale(.small).cornerRadius(15)
                        HStack{
                            Text("В Правительстве Москвы успешно прошел")
                                .padding(.leading, 20.0)
                            Spacer()
                        }
                        HStack{
                            Text("молодежный форум «Твой город - твое дело»")
                                .padding(.leading, 20.0)
                            Spacer()
                        }
                        Text("Сегодня")
                            .font(.subheadline)
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        Image("Выборы мэра").imageScale(.small).cornerRadius(15)
                        HStack{
                            Text("В Москве прошли выборы мэра").padding(.leading, 20.0)
                            Spacer()
                        }

                        Text("7 дней назад")
                            .font(.subheadline)
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        Image("Команда").imageScale(.small).cornerRadius(15)
                        HStack{
                            Text("Команда №1, люблю вас <3")
                        }
                        Text("Всегда")
                            .font(.subheadline)
                        Spacer()
                    }
                    //                Image("Карьерные сервисы").imageScale(.small)
                    Spacer().frame(height: 50)
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
            HStack{
                Spacer().frame(height: 5)
                VStack{
                    Image("gift_5").imageScale(.small).cornerRadius(20)
                    HStack{
                        Image("coin")
                        Text("6000")
                            .font(.subheadline)
                    }
                }
                VStack{
                    Image("gift_6").imageScale(.small).cornerRadius(20)
                    HStack{
                        Image("coin")
                        Text("15000")
                            .font(.subheadline)
                    }
                }
                Spacer().frame(height: 5)
            }
            HStack{
                Spacer().frame(height: 5)
                VStack{
                    Image("gift_7").imageScale(.small).cornerRadius(20)
                    HStack{
                        Image("coin")
                        Text("2000")
                            .font(.subheadline)
                    }
                }
                VStack{
                    Image("gift_8").imageScale(.small).cornerRadius(20)
                    HStack{
                        Image("coin")
                        Text("8000")
                            .font(.subheadline)
                    }
                }
                Spacer().frame(height: 5)
            }
            HStack{
                Spacer().frame(height: 5)
                VStack{
                    Image("gift_9").imageScale(.small).cornerRadius(20)
                    HStack{
                        Image("coin")
                        Text("500")
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
        Text("Разработчики")
            .font(.title)
        Divider()
        ScrollView{
            VStack{
                HStack{
                    Spacer()
                    Image("dev_Danita").cornerRadius(50)
                    Spacer()
                    VStack{
                        Text("Широкопетлев Никита").bold()
                        Text("Разработчик")
                    }
                    Spacer()
                }
                Divider()
                HStack{
                    Spacer()
                    VStack{
                        Text("Дарья Поликарпова").bold()
                        Text("Менеджер по продвижению")
                    }
                    Spacer()
                    Image("dev_Dasha").cornerRadius(50)
                    Spacer()
                }
            }
            VStack{
                Divider()
                HStack{
                    Spacer()
                    Image("dev_Nikita").cornerRadius(50)
                    Spacer()
                    VStack{
                        Text("Яновский Никита").bold()
                        Text("Тим-лидер")
                    }
                    Spacer()
                }
                Divider()
                HStack{
                    Spacer()
                    VStack{
                        Text("Незвоненко Карина").bold()
                        Text("Спонсор")
                    }
                    Spacer()
                    Image("dev_Karina").cornerRadius(50)
                    Spacer()
                }
            }
            VStack{
                Divider()
                HStack{
                    Spacer()
                    Image("dev_Artem").cornerRadius(50)
                    Spacer()
                    VStack{
                        Text("Устинов Артем").bold()
                        Text("Тайм-киппер")
                    }
                    Spacer()
                }
                Divider()
                HStack{
                    Spacer()
                    VStack{
                        Text("Меньшина Олеся").bold()
                        Text("Молодой специалист")
                    }
                    Spacer()
                    Image("dev_Lesia").cornerRadius(50)
                    Spacer()
                }
            }
            VStack{
                Divider()
                HStack{
                    Spacer()
                    Image("dev_Feduc").cornerRadius(50)
                    Spacer()
                    VStack{
                        Text("Сметанин Федор").bold()
                        Text("Бригадир")
                    }
                    Spacer()
                }
                Divider()
                HStack{
                    Spacer()
                    VStack{
                        Text("Полякова Света").bold()
                        Text("Генератор идей")
                    }
                    Spacer()
                    Image("dev_Sveta").cornerRadius(50)
                    Spacer()
                }
                
            }
            VStack{
                Divider()
                HStack{
                    Spacer()
                    Image("dev_Max").cornerRadius(50)
                    Spacer()
                    VStack{
                        Text("Максим Козачок").bold()
                        Text("Искатель")
                    }
                    Spacer()
                }
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

