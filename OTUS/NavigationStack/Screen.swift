//
//  Screen.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import Foundation
import SwiftUI

struct Screen: Identifiable, Equatable {
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id: String = UUID.init().uuidString
    
    public let screen: AnyView
    
    
    
}
