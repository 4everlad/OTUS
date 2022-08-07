//
//  NavigationStack.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import Foundation

public struct NavigationStack {
    private var screens: [Screen] = [Screen]()
    
    func top()->Screen? {
        self.screens.last
    }
    
    mutating func push(_ s: Screen) {
        self.screens.append(s)
    }
    
    mutating func pop() {
        _ = self.screens.popLast()
    }
    
    mutating func popToRoot() {
        self.screens.removeAll()
    }
    
    
}
