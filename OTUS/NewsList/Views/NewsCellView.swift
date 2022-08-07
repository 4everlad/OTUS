//
//  NewsCellView.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import SwiftUI

struct NewsCellView: View {
    
    let name: String
    
    var body: some View {
        Text(name)
    }
}

struct NewsCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCellView(name: "Fuck")
    }
}

