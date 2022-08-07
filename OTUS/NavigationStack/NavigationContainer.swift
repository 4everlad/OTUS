//
//  NavigationContainer.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import SwiftUI

protocol ItemView : View {
    var listener: INavigationContainer? {get set}
}

protocol INavigationContainer {
    func push<Content:View&ItemView>(view: Content)
    func pop()
    
    func popToRoot()
}

struct NavigationContainer<Content:View&ItemView>: View, INavigationContainer {
    func pop() {
        self.model.pop()
    }
    
    func popToRoot() {
        self.model.popToRoot()
    }
    
    @ObservedObject var model = NavigationViewModel()
    private let animation: Animation = .easeIn(duration: 0.3)
    private var content: Content
    
    init(@ViewBuilder content: @escaping ()->Content) {
        self.content = content()
        self.content.listener = self
    }
    
    var body: some View {
        let isRoot = model.currentScreen == nil
        return ZStack {
            if isRoot {
                content
                    .animation(self.animation)
            } else {
                model.currentScreen?.screen
                    .animation(self.animation)
            }
        }
    }
    
    func push<Content>(view: Content) where Content : View&ItemView {
        var v = view
        v.listener = self
        self.model.push(v.toAny())
    }
}
