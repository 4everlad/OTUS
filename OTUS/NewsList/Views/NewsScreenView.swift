//
//  NewsScreenView.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import SwiftUI
import NetworkLayer

struct NewsScreenView: View, ItemView {
    var listener: INavigationContainer?
    
    var news: News
    
    var body: some View {
        NavigationView {
            VStack {
                Text(news.title ?? "")
                    .navigationBarItems(leading:
                        Button(action: {
                            listener?.pop()
                        }, label: {
                            Text("News")
                        })
                    )
                    .navigationBarTitle(Text("Article"))
                    .navigationBarTitleDisplayMode(.inline)
                    .padding()
                
                Button(action: {
                    listener?.push(view: DescriptionScreenView(description: news.description ?? ""))
                }, label: {
                    Text("Show description")
                })
            }
        }
    }
}

//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView()
//    }
//}
