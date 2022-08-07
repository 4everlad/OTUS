//
//  LoadingProgressView.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import Foundation
import SwiftUI

struct LoadingProgressView: ViewModifier {
    
    let withLoading: Bool
    
    func body(content: Content)-> some View {
        if withLoading {
            VStack {
                content
                Divider()
                HStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                    Spacer()
                }
            }
        } else {
            content
        }
    }
}
