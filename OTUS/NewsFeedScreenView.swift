//
//  NewsFeedScreenView.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import SwiftUI

struct NewsFeedScreenView: View, ItemView {
    
    var listener: INavigationContainer?
    
    @EnvironmentObject private var viewModel: NewsViewModel
    
    var body: some View {
        VStack {
            Picker("News type", selection: $viewModel.newsType) {
                ForEach(NewsType.allCases, id: \.self) { value in
                    Text(value.rawValue)
                        .tag(value)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.top, 30)
            
            NewsListView(listener: listener)
            
            Spacer()
        }.navigationTitle(Text("News"))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedScreenView()
    }
}
