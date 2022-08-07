//
//  NewsListView.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import SwiftUI

struct NewsListView: View, ItemView {
    var listener: INavigationContainer?
    
    @EnvironmentObject var viewModel: NewsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.news) { item in
                let isElementLast = viewModel.news.isLast(item)
                NewsCellView(name: item.title ?? "")
                    .onTapGesture {
                        listener?.push(view: NewsScreenView(news: item))
                    }
                    .onAppear {
                        if viewModel.canLoad && isElementLast {
                            viewModel.getNews()
                        }
                    }
                    .progressBar(isLoading: !viewModel.canLoad && isElementLast)
            }
        }
        .onAppear {
            viewModel.getNews()
        }
    }
}

//struct NewsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsListView()
//    }
//}
