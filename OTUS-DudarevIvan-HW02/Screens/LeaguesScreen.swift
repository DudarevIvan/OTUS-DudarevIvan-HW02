//
//  CountriesView.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/31/21.
//

import SwiftUI

struct LeaguesScreen: View {
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
    }
    
    @EnvironmentObject var footballViewModel: FootballViewModel
    
    var body: some View {
        VStack {
            HeaderView(title: "Leagues")
            List() {
                ForEach(footballViewModel.items[0].leagues!) { league in
                    NavigationPushButton(destination: SeasonsScreen().environmentObject(footballViewModel)) {
                        Text(league.name!)
                            .foregroundColor(.white)
                            .font(.headline)
                    }.listRowBackground(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
                }
            }
        }
    }
}
