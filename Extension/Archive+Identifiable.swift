//
//  Archive+Identifiable.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 4/1/21.
//

import Foundation
import FootballNetworking

extension Archive: Identifiable {
    public var id: Int {
        page!
    }
}
