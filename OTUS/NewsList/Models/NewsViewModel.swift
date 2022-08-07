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
    
    @Published var news: [News] = []
    @Published var newsType: NewsType = .business {
        didSet {
            news = []
            currentNewsCount = 0
            getNews()
        }
    }
    
    var canLoad = true
    private var totalNewsCount: Int = .max
    private var currentNewsCount: Int = 0
    
    
    func getNews() {
        
        guard currentNewsCount < totalNewsCount else { return }
        guard canLoad == true else { return }
        let newsCount = String(currentNewsCount)
        
        canLoad = false
        NewsAPI.getNews(accessKey: Constants.apiKey, categories: newsType.rawValue, languages: "en", offset: newsCount, completion: { [weak self] data, error in
            if error == nil {
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
