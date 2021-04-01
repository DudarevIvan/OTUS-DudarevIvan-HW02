//
//  File.swift
//  
//
//  Created by Ivan Dudarev on 3/31/21.
//

import Foundation
   
public class ImageAPI {
    
    public static let shared: ImageAPI = .init()
    
    // Generic function for return data(use example - Image)
    public func loadImage(_ url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            completion(Result.success(data))
        }.resume()
    }
}
