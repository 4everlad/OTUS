//
//  DescriptionScreenView.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 07.08.2022.
//

import SwiftUI

struct DescriptionScreenView: View, ItemView {
    var listener: INavigationContainer?
    
    let description: String
    
    var body: some View {
        NavigationView {
            Text(description)
                .navigationBarItems(leading:
                    Button(action: {
                        listener?.pop()
                    }, label: {
                        Text("Article")
                    })
                )
                .navigationBarTitle(Text("Description"))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionScreenView(description: "")
    }
}
