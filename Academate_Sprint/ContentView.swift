//
//  ContentView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userDefaultsManager = UserDefaultsManager.shared
    var body: some View {
        if userDefaultsManager.getIsLoggedIn() {
                    // User is logged in, show HomeView
                    HomeView()
                } else {
                    // User is not logged in, show LoginView
                    LoginView()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
