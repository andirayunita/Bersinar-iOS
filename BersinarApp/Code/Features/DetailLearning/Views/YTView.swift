//
//  YTView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 06/01/24.
//

import SwiftUI
import WebKit

struct Video: UIViewRepresentable {
    let videoId: String
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let YouTubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: YouTubeURL))
    }
}

struct YTView: View {
    let id: String
    
    var body: some View {
        Video(videoId: id)
            .frame(width: 350, height: 200)
            .cornerRadius(12)
    }
}

struct GDView: View {
    let url: String
    
    var body: some View {
        GoogleDriveWeb(urlString: url)
            .frame(minWidth: 350, maxWidth: .infinity, minHeight: 700, maxHeight: .infinity)
            .padding(2)
            .cornerRadius(12)
    }
}

struct GoogleDriveWeb: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

#Preview {
    YTView(id: "")
}
