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
import ImageNetworking

struct ContentView: View {
    
    @ObservedObject var footballViewModel: FootballViewModel = .init()
    @ObservedObject var archiveViewModel: ArchiveViewModel = .init()
    
    var body: some View {
        VStack {
            List(footballViewModel.items) { country in
                CountryCell(name: country.name!, imageUrl: country.flag!)
            }
            //            if !footballViewModel.items.isEmpty {
            //                Text(footballViewModel.items.first!.name!)
            //                    .onAppear() { archiveViewModel.loadPage(url: footballViewModel.items.first!.leagues!.first!.seasons!.first!.archive!, page: 1)
            //                    }
            //            } else {
            //                EmptyView()
            //            }
            //            Text(archiveViewModel.items.ht?.first ?? "s")
        }
    }
}

struct CountryCell: View {
    
    @ObservedObject var loadImage: LoadImage = .init()
    
    let name: String
    let imageUrl: String
    
    var body: some View {
        HStack {
            Text(name).onAppear() {
                loadImage.fetchData(from: imageUrl)
            }
            Spacer()
            if loadImage.image != nil {
            loadImage.image!
                .resizable()
                .scaledToFit()
                .aspectRatio(CGSize(width: 3, height: 2), contentMode: .fill)
                .frame(width: 60, height: 40)
            } else {
                EmptyView()
            }
        }
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

