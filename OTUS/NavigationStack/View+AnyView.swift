//
//  View+AnyView.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import Foundation
import SwiftUI

extension View {
    func toAny()->AnyView {
        return AnyView(self)
    }
}
