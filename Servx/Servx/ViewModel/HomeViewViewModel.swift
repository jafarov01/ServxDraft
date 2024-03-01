//
//  HomeViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/11/2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

@MainActor
class HomeViewViewModel: ObservableObject {
    
    @Published var recommendedServiceProviderPosts: [ServiceProviderPost] = []
    @ObservedObject var profilePhotoViewModel = ProfilePhotoViewModel()
    
    required init() {
        fetchRecommendedServiceProviderPosts()
    }
    
    func fetchRecommendedServiceProviderPosts() {
        let postsRef = Firestore.firestore().collection("serviceProviderPosts")
        
        // Create a Query object to filter for recommended posts
        let query = postsRef.whereField("isRecommended", isEqualTo: true)
        
        query.getDocuments { snapshot, error in
            if let error = error {
                print("MEX Error fetching recommended service provider posts: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                return
            }
            
            let posts: [ServiceProviderPost] = documents.compactMap { document in
                do {
                    let post = try document.data(as: ServiceProviderPost.self)
                    return post
                } catch {
                    print("MEX Error decoding document: \(error)")
                    return nil
                }
            }
            
            DispatchQueue.main.async {
                self.recommendedServiceProviderPosts = posts
            }
        }
    }
}

