//
//  NewsCell+Loading.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import SwiftUI

extension View {
    func progressBar(isLoading: Bool) -> some View {
        self
            .modifier(LoadingProgressView(withLoading: isLoading))
    }
}
