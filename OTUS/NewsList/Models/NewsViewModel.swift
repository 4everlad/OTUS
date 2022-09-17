//
//  NewsViewModel.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import Foundation
import NetworkLayer

enum NewsType: String, CaseIterable {
    case business, technology, science
}

final class NewsViewModel: ObservableObject {
    
    @Injected var network: NetworkService?
    @Injected var dataStorage: DataStorage?
    @Published var news: [News] = []
    @Published var newsType: NewsType? {
        didSet {
            dataStorage?.newsType = newsType
            news = []
            currentNewsCount = 0
            getNews()
        }
    }
    
    var canLoad = true
    private var totalNewsCount: Int = .max
    private var currentNewsCount: Int = 0

    
    init() {
//        если newsType не optional, то получаю следующую ошибку - 'self' used in property access 'dataStorage' before all stored properties are initialized
        self.newsType = dataStorage?.newsType ?? .business
    }
    
    func getNews() {
        
        guard currentNewsCount < totalNewsCount else { return }
        guard canLoad == true else { return }
        let newsCount = String(currentNewsCount)
        
        canLoad = false
        guard let newsType = newsType else { return }

        network?.getNews(newsType: newsType, offset: newsCount, completion: { [weak self] res in
            switch res {
            case .success(let newsList):
                self?.news.append(contentsOf: newsList.data ?? [])
                self?.totalNewsCount = newsList.pagination?.total ?? .max
                self?.currentNewsCount += newsList.pagination?.count ?? 0
            case .failure(let error):
                print("newsError: \(String(describing: error))")
            }
            self?.canLoad = true
        })
    }
}
