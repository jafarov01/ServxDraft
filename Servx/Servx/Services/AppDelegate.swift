//
//  AppDelegate.swift
//  Servx
//
//  Created by Makhlug Jafarov on 21/10/2023.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}


//rules_version = '2';
//
//service cloud.firestore {
//  match /databases/{database}/documents {
//    match /{document=**} {
//      allow read, write: if false;
//    }
//  }
//}
