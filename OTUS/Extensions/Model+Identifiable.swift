//
//  Model+Identifiable.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import Foundation
import NetworkLayer

extension News: Identifiable {
    public var id: String { url }
}
