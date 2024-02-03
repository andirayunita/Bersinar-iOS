//
//  BersinarAppApp.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/10/23.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct BersinarAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthenticationViewModel()
    @State private var isShowingSplashScreen = true
    
    var body: some Scene {
        WindowGroup {
            if isShowingSplashScreen {
                SplashscreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isShowingSplashScreen = false
                        }
                    }
            } else {
                ContentView()
                    .environmentObject(authViewModel)
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        preloadSplashImage()
        FirebaseApp.configure()
        let db = Firestore.firestore()
        return true
    }
    
    func preloadSplashImage() {
        let _ = UIImage(named: "logobersinar")
    }
}
