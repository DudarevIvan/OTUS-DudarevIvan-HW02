//
//  LoadImage.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/28/21.
//

import SwiftUI
import FootballNetworking

final class LoadImage: ObservableObject {
    
    @Published var image: Image?
    
    func fetchData(from url: String) {
        NetworkImage.shared.loadImage(url) { (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = Image(uiImage: UIImage(data: data)!)
                }
            case.failure(let error):
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }
}
