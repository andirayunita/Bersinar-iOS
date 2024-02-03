//
//  ContentView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State private var showSignInView: Bool = true
    
    var body: some View {
        Group {
            if authViewModel.currentUser == nil {
                NavigationView {
                    LoginView(showSignInView: $showSignInView)
                        .fullScreenCover(isPresented: $showSignInView) {
                            LoginView(showSignInView: $showSignInView)
                    }
                }
            } else {
                ZStack {
                    NavigationView {
                        BersinarTabView()
                    }
                }
                .onAppear {
                    let authUser = try? authViewModel.fetchUser()
                    self.showSignInView = authUser == nil
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())
    }
}
