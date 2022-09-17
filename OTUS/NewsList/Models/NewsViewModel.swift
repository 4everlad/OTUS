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
            print("newsType didSet: \(newsType?.rawValue)")
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
        self.newsType = dataStorage?.newsType ?? .business
        print("newsType init: \(newsType?.rawValue)")
    }
    
    func getNews() {
        
        guard currentNewsCount < totalNewsCount else { return }
        guard canLoad == true else { return }
        let newsCount = String(currentNewsCount)
        
        canLoad = false
        guard let newsType = newsType else { return }
        print("newsType getNews: \(newsType.rawValue)")

        NewsAPI.getNews(accessKey: Constants.apiKey, categories: newsType.rawValue, languages: "en", offset: newsCount, completion: { [weak self] data, error in
            if error == nil {
                self?.network?.doRequest()
                print("getNews: \(String(describing: data))")
                self?.news.append(contentsOf: data?.data ?? [])
                self?.totalNewsCount = data?.pagination?.total ?? .max
                self?.currentNewsCount += data?.pagination?.count ?? 0
            } else {
                print("newsError: \(String(describing: error))")
            }
            self?.canLoad = true
        })
    }
}
