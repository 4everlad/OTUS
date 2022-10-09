//
//  ProfileScreen.swift
//  OTUS
//
//  Created by Dmitry Bakulin on 09.10.2022.
//

import SwiftUI

struct ProfileScreenView: View, ItemView {
    
    var listener: INavigationContainer?
    
    var body: some View {
        Text("Profile Screen")
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView()
    }
}
