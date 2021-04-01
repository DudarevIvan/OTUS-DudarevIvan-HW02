//
//  FootballViewModel.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/31/21.
//

import Foundation
import FootballNetworking


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
