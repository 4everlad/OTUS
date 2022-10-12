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
    
    @State var tabSelection = 0
    
    var body: some Scene {
        
        WindowGroup {
            NavigationContainer {
                TabController(tabSelection: $tabSelection)
            }
                .environmentObject(NewsViewModel())
                .onOpenURL { url in
                    if url == URL(string: "widget://NewsTab") {
                        tabSelection = 0
                    } else if url == URL(string: "widget://ProfileTab") {
                        tabSelection = 1
                    }
                }
        }
    }
}
