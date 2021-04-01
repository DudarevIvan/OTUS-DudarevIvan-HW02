//
//  File.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/31/21.
//

import SwiftUI

struct CustomNavigationControllerView<Content>: View where Content: View {
    
    @ObservedObject var viewModel: NavigationControllerViewModel
    
    private let content: Content
    private let transitions: (push: AnyTransition, pop: AnyTransition)
    
    public init(@ViewBuilder content: @escaping () -> Content, transition: NavigationTransition, easing: Animation = .easeInOut(duration: 0.33)) {
        self.content = content()
        self.viewModel = NavigationControllerViewModel(easing: easing)
        
        switch transition {
        case .custom(let tr):
            self.transitions = (tr, tr)
        default:
            self.transitions = (.identity, .identity)
        }
    }
    
    public var body: some View {
        let isRootView = viewModel.currentScreen == nil
        return
            GeometryReader { geometry in
                VStack {
                    //HeaderView()
                    if isRootView {
                        content
                            .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
                            .environmentObject(viewModel)
                    } else {
                        viewModel.currentScreen!.nextScreen
                            .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
                            .environmentObject(viewModel)
                    }
                }
            }
    }
}

//struct HeaderView: View {
//
//    var body: some View {
//        Text("")
//    }
//
//}

public struct NavigationPushButton<Label, Destination>: View where Label: View, Destination: View {
    
    @EnvironmentObject var viewModel: NavigationControllerViewModel
    
    private let label: () -> Label
    private let destination: Destination
    
    public init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.destination = destination
    }
    
    public var body: some View {
        label()
            .onTapGesture {
                viewModel.push(destination)
            }
    }
}


public struct NavigationPopButton<Label>: View where Label: View {
    
    @EnvironmentObject var viewModel: NavigationControllerViewModel
    
    private let label: () -> Label
    private let destination: PopDestination
    
    public init(destination: PopDestination = .previous, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.destination = destination
    }
    
    public var body: some View {
        label()
            .onTapGesture {
                viewModel.pop(to: destination)
            }
    }
}


