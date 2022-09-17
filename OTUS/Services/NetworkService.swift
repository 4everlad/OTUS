//
//  NetworkService.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 30.08.2022.
//

import Foundation
import NetworkLayer

class NetworkService {
    func getNews(newsType: NewsType, offset: String, completion: @escaping(Result<NewsList, Error>) -> Void) {
        NewsAPI.getNews(accessKey: Constants.apiKey, categories: newsType.rawValue, languages: "en", offset: offset, completion: { data, error in
            if error == nil {
                print("getNews: \(String(describing: data))")
                completion(.success(data!))
            } else {
                print("newsError: \(String(describing: error))")
                completion(.failure(error!))
            }
        })
                
    }
}
