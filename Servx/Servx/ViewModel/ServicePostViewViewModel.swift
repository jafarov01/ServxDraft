//
//  ServicePostViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 10/12/2023.
//

import Foundation
import SwiftUI
import FirebaseFirestore

@MainActor
final class ServicePostViewViewModel : ObservableObject {
    
    func toggleBookmark(for postId: String, isBookmarked: Bool) {
        // Assuming AuthenticatedUser.shared.bookmarkedServices is an array of Bookmark
        var user = AuthenticatedUser.shared
        
        if isBookmarked {
            // Remove the bookmark
            user.bookmarkedServices.removeAll { $0.serviceProviderPostReferenceID == postId }
        } else {
            // Add a new bookmark
            let newBookmark = Bookmark(bookmarkID: UUID().uuidString, serviceProviderPostReferenceID: postId)
            user.bookmarkedServices.append(newBookmark)
        }
        
        // Update the user's bookmark list in Firestore
        updateBookmarksInFirebase(for: user.id, bookmarks: user.bookmarkedServices)
    }
    
    private func updateBookmarksInFirebase(for userId: String, bookmarks: [Bookmark]?) {
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userId)
        
        // Convert bookmarks to a format suitable for Firestore
        let bookmarksData = bookmarks?.map { ["bookmarkID": $0.bookmarkID, "serviceProviderPostReferenceID": $0.serviceProviderPostReferenceID] }
        
        // Update the bookmarks array in Firestore
        userRef.updateData(["bookmarkedServices": bookmarksData ?? []]) { error in
            if let error = error {
                print("Error updating bookmarks: \(error)")
            } else {
                print("Bookmarks successfully updated")
            }
        }
    }
    
}
