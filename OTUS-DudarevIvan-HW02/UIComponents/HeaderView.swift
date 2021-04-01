//
//  HeaderView.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 4/1/21.
//

import SwiftUI

struct HeaderView: View {
    
    var title = ""
    var isRoot = false
    
    var body: some View {
        HStack {
            if !isRoot {
                NavigationPopButton() {
                    Image(systemName: "chevron.backward")
                }
            }
            Spacer()
            Text(self.title).bold()
            Spacer()
            NavigationPopButton(destination: .root) {
                Image(systemName: "house")
            }
            
        }
        .font(Font.system(size: 18))
        .foregroundColor(.white)
        .offset(y: 20)
        .padding()
        .padding(.top, 20)
    }
}
