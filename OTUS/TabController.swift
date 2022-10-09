//
//  TabView.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 09.10.2022.
//

import SwiftUI

struct TabController: View, ItemView {
    
    var listener: INavigationContainer?
    
    @State var tabSelection: Int = 0
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            NewsFeedScreenView(listener: listener)
                .tag(0)
                .tabItem {
                    Label("News", systemImage: "list.bullet.rectangle")
                }
            
            ProfileScreenView(listener: listener)
                .tag(1)
                .tabItem {
                    Label("Profile", systemImage: "gear")
                }
        }
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
    }
}
