//
//  ContentView.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/26/21.
//

import SwiftUI

import SwiftUI
import FootballNetworking

struct ContentView: View {
    
    @ObservedObject var footballViewModel: FootballViewModel = .init()
    
    var body: some View {
        List(footballViewModel.items) { item in
            Text(item.name!)
                .padding()
        }.onAppear() {
            footballViewModel.loadPage()
        }
    }
}

final class FootballViewModel: ObservableObject {
    
    @Published private(set) var items: [Country] = .init()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
        FootballAPI.getFootballList { response, error in
            if let results = response?.countries {
                print(results)
                self.items.append(contentsOf: results)
            }
            self.isPageLoading = false
        }
    }
    
}
