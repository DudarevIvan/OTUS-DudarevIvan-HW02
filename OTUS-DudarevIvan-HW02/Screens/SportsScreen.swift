//
//  ContentView.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/26/21.
//

import SwiftUI

struct SportsScreen: View {
    
    var body: some View {
        GeometryReader { geometry in
            CustomNavigationControllerView(content: {
                Sports()
            }, transition: .custom(.scale))
        }
    }
}


struct Sports: View {
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
    }
    
    private let countries: Array<String> = ["Football", "Hockey", "Basketball", "Tennis"]
    
    var body: some View {
        VStack {
            HeaderView(title: "Sports", isRoot: true)
            List() {
                ForEach(countries, id: \.self) { country in
                    NavigationPushButton(destination: CountriesScreen()) {
                        Text(country)
                            .font(.headline)
                    }
                }.listRowBackground(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
            }
        }
            .foregroundColor(.white)
            .offset(y: 20)
    }
    
}



