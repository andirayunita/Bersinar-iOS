//
//  SplashscreenView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 22/10/23.
//

import SwiftUI

struct SplashscreenView: View {
    var body: some View {
        ZStack {
            Color.primary10
                .ignoresSafeArea()
            
            Image("logobersinar")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
}

struct SplashscreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashscreenView()
    }
}
