//
//  OTUSApp.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import SwiftUI

@main
struct OTUSApp: App {
    init() {
        Configurator.shared.register()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationContainer {
                TabController()
            }
                .environmentObject(NewsViewModel())
        }
    }
}
