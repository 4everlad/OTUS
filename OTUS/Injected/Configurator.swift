//
//  Configurator.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 30.08.2022.
//

import Foundation

import Foundation

class Configurator {
    static let shared = Configurator()
    
    func register() {
        ServiceLocator.shared.addServices(service: NetworkService())
        ServiceLocator.shared.addServices(service: DataStorage())
    }
}
