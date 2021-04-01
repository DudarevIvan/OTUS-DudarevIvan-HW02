//
//  FootballView.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/31/21.
//

import SwiftUI
import FootballNetworking

struct CountriesScreen: View {
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
    }
    
    @ObservedObject var footballViewModel: FootballViewModel = .init()
    
    var body: some View {
        VStack {
            HeaderView(title: "Countries")
            List() {
                ForEach(footballViewModel.items) { country in
                    CountriesCell(country: country)
                        .environmentObject(footballViewModel)
                }.listRowBackground(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
            }
        }
    }
}

struct CountriesCell: View {
    
    @EnvironmentObject var footballViewModel: FootballViewModel
    @ObservedObject var imageViewModel: ImageViewModel = .init()
    var country: Country
    
    var body: some View {
        HStack {
            NavigationPushButton(destination: LeaguesScreen().environmentObject(footballViewModel)) {
                Text(country.name!)
                    .foregroundColor(.white)
                    .font(.headline)
                    .onAppear() {
                        imageViewModel.fetchData(from: country.flag!)
                    }
            }
            Spacer()
            imageViewModel.image?
                .resizable()
                .frame(width: 60, height: 40)
        }
    }

}
