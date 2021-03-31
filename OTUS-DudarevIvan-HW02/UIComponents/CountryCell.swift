//
//  CountryCell.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/28/21.
//

import SwiftUI

struct CountryCell: View {
    
    @ObservedObject var loadImage: LoadImage = .init()
    
    let name: String
    let imageUrl: String
    let leaguesCount: Int
    
    var body: some View {
        ZStack {
            //Color(red: 78.0/255, green: 78.0/255, blue: 83.0/255)
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .bold()
                        .font(.system(size: 18))
                        .onAppear() {
                            loadImage.fetchData(from: imageUrl)
                    }
                    Text("Leagues: \(leaguesCount)")
                        .foregroundColor(.gray)
                }
                Spacer()
                if loadImage.image != nil {
                    loadImage.image!
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(CGSize(width: 3, height: 2), contentMode: .fill)
                        .frame(width: 60, height: 40)
                } else {
                    Rectangle()
                        .frame(width: 60, height: 40)
                        .foregroundColor(.gray).opacity(0.4)
                }
            }
        }
    }
}
