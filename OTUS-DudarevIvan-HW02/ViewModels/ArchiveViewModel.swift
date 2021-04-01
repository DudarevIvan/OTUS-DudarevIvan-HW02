//
//  ArchiveViewModel.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/31/21.
//

import Foundation
import FootballNetworking

final class ArchiveViewModel: ObservableObject {
    
    @Published private(set) var items: [Archive] = .init()
    @Published private(set) var isPageLoading: Bool = false
    @Published private(set) var page: Int = 0
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        self.page += 1
        ArchiveAPI.getFootballArchive(urlArchive: "https://www.wellwin-app.com/data/football/argentina/argentina_ligaprofesional_2016", page: page) { [self] response, error in
            if let results = response {
                self.items.append(results)
            }
            self.isPageLoading = false
        }
    }
}
