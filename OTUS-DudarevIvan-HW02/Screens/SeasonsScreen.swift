//
//  SeasonsView.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 4/1/21.
//

import SwiftUI

struct SeasonsScreen: View {
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
    }
    
    @EnvironmentObject var footballViewModel: FootballViewModel
    
    var body: some View {
        VStack {
            HeaderView(title: "Seasons")
            List() {
                ForEach(footballViewModel.items[0].leagues![0].seasons!) { season in
                    NavigationPushButton(destination: GamesScreen()) {
                        Text(season.season!)
                            .foregroundColor(.white)
                            .font(.headline)
                    }.listRowBackground(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
                }
            }
        }
    }
}
