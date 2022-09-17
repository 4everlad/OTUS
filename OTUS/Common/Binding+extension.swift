//
//  Binding+extension.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 17.09.2022.
//

import Foundation
import SwiftUI

extension Binding {
    func optionalBinding<T>(defaultValue: T) -> Binding<T> where Value == Optional<T> {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
