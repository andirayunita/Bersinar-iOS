//
//  CircularProfileImageView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 24/10/23.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("logobersinar")
            .resizable()
            .frame(width: 72, height: 72)
            .clipShape(Circle())
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView()
    }
}
