//
//  ServxApp.swift
//  Servx
//
//  Created by Makhlug Jafarov on 13/10/2023.
//

import SwiftUI
import Firebase

@main
struct ServxApp: App {
    @State private var path = NavigationPath()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            Root()
                .environmentObject(AuthenticationManager.shared)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        
        return true
    }
    
}
