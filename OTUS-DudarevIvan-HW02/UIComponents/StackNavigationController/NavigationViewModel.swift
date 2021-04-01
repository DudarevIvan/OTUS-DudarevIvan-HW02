//
//  NavigationViewModel.swift
//  OTUS-DudarevIvan-HW02
//
//  Created by Ivan Dudarev on 3/31/21.
//

import SwiftUI

public enum PopDestination {
    case root
    case previous
}

public enum NavigationTransition {
    case none
    case custom(AnyTransition)
}

enum NavigationType {
    case pop
    case push
}

public final class NavigationControllerViewModel: ObservableObject {
    
    @Published var currentScreen: Screen?
    
    private var screenStack: ScreenStack = .init() {
        didSet {
            self.currentScreen = screenStack.topScreen()
        }
    }
    
    var navigationType: NavigationType = .push
    private let easing: Animation
    
    init(easing: Animation) {
        self.easing = easing
    }
    
    func push<S: View>(_ screenView: S) {
        withAnimation(easing) {
            
            let screen: Screen = .init(id: UUID().uuidString, nextScreen: AnyView(screenView))
            screenStack.push(screen)
        }
    }
    
    func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            switch to {
            case .root:
                screenStack.popToRootScreen()
            case .previous:
                screenStack.popToPreviousScreen()
            }
        }
    }
    
}
