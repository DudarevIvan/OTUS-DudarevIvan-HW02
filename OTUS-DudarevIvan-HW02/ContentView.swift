//
//  ContentView.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/26/21.
//

import SwiftUI

import SwiftUI
import FootballNetworking
import ArchiveNetworking

struct ContentView: View {
    
    @ObservedObject var footballViewModel: FootballViewModel = .init()
    @ObservedObject var archiveViewModel: ArchiveViewModel = .init()
    
    var body: some View {
        VStack {
            if !footballViewModel.items.isEmpty {
                Text(footballViewModel.items.first!.name!)
                    .onAppear() { archiveViewModel.loadPage(url: footballViewModel.items.first!.leagues!.first!.seasons!.first!.archive!, page: 1)
                    }
            } else {
                EmptyView()
            }
            Text(archiveViewModel.items.ht?.first ?? "s")
        }
    }
}

struct At: View {
    let name: String
    var body: some View {
        Text(name)
    }
}

    
    final class FootballViewModel: ObservableObject {
        
        @Published private(set) var items: [Country] = .init()
        @Published private(set) var page: Int = 0
        @Published private(set) var isPageLoading: Bool = false
        
        init() {
            self.loadPage()
        }
        
        func loadPage() {
            guard isPageLoading == false else {
                return
            }
            isPageLoading = true
            page += 1
            FootballAPI.getFootballList { response, error in
                if let results = response?.countries {
                    self.items.append(contentsOf: results)
                }
                self.isPageLoading = false
            }
        }
    }
    
    final class ArchiveViewModel: ObservableObject {
        
        @Published private(set) var items: Archive = .init()
        @Published private(set) var isPageLoading: Bool = false
        
        func loadPage(url: String, page: Int) {
            guard isPageLoading == false else {
                return
            }
            isPageLoading = true
            ArchiveAPI.getFootballArchive(urlArchive: url, page: page) { response, error in
                if let results = response {
                    self.items = results
                }
                self.isPageLoading = false
            }
        }
    }

