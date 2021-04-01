//
//  GamesView.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/31/21.
//

import SwiftUI
import FootballNetworking

struct GamesScreen: View {
    
    @State private var selectedTeam: Teams = .home
    @State private var team = Array<String>()
    
    var body: some View {
        VStack {
            HeaderView(title: "Games")
            Picker("Teams", selection: $selectedTeam) {
                ForEach(Teams.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            switch selectedTeam {
            case .home:
                HomeTeam()
            case .away:
                AwayTeam()
            }
        }
    }
}


enum Teams: String, CaseIterable {
    case home = "Home team"
    case away = "Away team"
}


struct HomeTeam: View {
    
    @ObservedObject private var archiveViewModel: ArchiveViewModel = .init()
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
    }
    
    var body: some View {
        List() {
            ForEach(archiveViewModel.items) { archive in
                HomeTeamCell(archive: archive)
                    .environmentObject(archiveViewModel)
                    .onAppear() {
                        if archiveViewModel.items.isLast(archive) {
                            archiveViewModel.loadPage()
                        }
                    }
            }.listRowBackground(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
        }
        .onAppear() {
            archiveViewModel.loadPage()
        }
    }
}

struct HomeTeamCell: View {
    
    @EnvironmentObject var archiveViewModel: ArchiveViewModel
    var archive: Archive
    
    var body: some View {
        ForEach(archive.ht!, id: \.self) { item in
            Text(item)
        }
        if archiveViewModel.isPageLoading && archiveViewModel.items.isLast(archive) {
            Divider()
            HStack(alignment: .center) {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer()
            }
            
        }
    }
    
}


struct AwayTeam: View {
    
    @ObservedObject private var archiveViewModel: ArchiveViewModel = .init()
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
    }
    
    var body: some View {
        List() {
            ForEach(archiveViewModel.items) { archive in
                HomeTeamCell(archive: archive)
                    .environmentObject(archiveViewModel)
                    .onAppear() {
                        if archiveViewModel.items.isLast(archive) {
                            archiveViewModel.loadPage()
                        }
                    }
            }.listRowBackground(Color(red: 104.0/255, green: 101.0/255, blue: 107.0/255))
        }
        .onAppear() {
            archiveViewModel.loadPage()
        }
    }
    
}


struct AwayTeamCell: View {
    
    @EnvironmentObject var archiveViewModel: ArchiveViewModel
    var archive: Archive
    
    var body: some View {
        ForEach(archive.at!, id: \.self) { item in
            Text(item)
        }
        if archiveViewModel.isPageLoading && archiveViewModel.items.isLast(archive) {
            Divider()
            HStack(alignment: .center) {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer()
            }
            
        }
    }
    
}
