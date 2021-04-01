//
//  OTUS_DudarevIvan_HW02App.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/26/21.
//

import SwiftUI

@main
struct OTUS_DudarevIvan_HW02App: App {
    var body: some Scene {
        WindowGroup {
            SportsScreen()
                .background(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255)).ignoresSafeArea()
        }
    }
}
