//
//  FirebaseManager.swift
//  Servx
//
//  Created by Makhlug Jafarov on 26/11/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import SwiftUI
import Firebase

final class FirestoreManager {
    static let shared = FirestoreManager()
    let storage = FirebaseStorage.Storage.storage()
    var authUser = AuthenticatedUser.shared
    
    private init() {}
        
    func updateUserData(completion: @escaping (Error?) -> Void) {
        let userRef = Firestore.firestore().collection("users").document(authUser.id)
        
        do {
            try userRef.setData(from: authUser, completion: completion)
        } catch {
            completion(error)
        }
    }
    
    func getUserPhoto(completion: @escaping (Result<UIImage, Error>) -> Void) {
        let folderPath = "\(authUser.id)/profileImage"
        
        print("MEX getUserPhoto Called")
        
        let imageName = "\(authUser.id).jpg"
        
        print("MEX userID getUserPhotoda: \(authUser.id)")
        
        let storageRef = storage.reference().child("\(folderPath)/\(imageName)")
        
        storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let imageData = data, let image = UIImage(data: imageData) else {
                let noPhotoError = NSError(domain: "AppDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "No profile photo found"])
                completion(.failure(noPhotoError))
                return
            }
            
            completion(.success(image))
        }
    }
    
    
    func uploadImageAndUpdateUser(selectedImage: UIImage) {
        print("MEX: userID: \(authUser.id)")
        
        let folderPath = "\(authUser.id)/profileImage"
        
        let imageName = "\(authUser.id).jpg"
        
        let storageRef = storage.reference().child("\(folderPath)/\(imageName)")
        
        print("MEX: Upload - Storage Reference created")
        
        let resizedImage = selectedImage.aspectFittedToHeight(200)
        
        print("MEX: Upload - Image resized")
        
        let data = resizedImage.jpegData(compressionQuality: 0.2)
        
        print("MEX: Upload - Image converted to data")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        print("MEX: Upload - Metadata created")
        
        // Upload the image
        if let data = data {
            storageRef.putData(data, metadata: metadata) { [weak self] (metadata, error) in
                guard let self = self else { return }
                
                if let error = error {
                    print("MEX: Error while uploading file: ", error)
                    return
                }
                
                if let metadata = metadata {
                    print("MEX: Metadata: ", metadata)
                    
                    storageRef.downloadURL { (url, error) in
                        if let error = error {
                            print("MEX: Error while getting download URL: ", error)
                            return
                        }
                        
                        if let downloadURL = url {
                            print("MEX: Download URL: ", downloadURL)
                            self.updateUserPhotoURL(downloadURL)
                        }
                    }
                }
            }
        }
    }
    
    
    func updateUserPhotoURL(_ photoURL: URL) {
        let userRef = Firestore.firestore().collection("users").document(authUser.id)
        
        userRef.updateData(["photoURL": photoURL.absoluteString]) { error in
            if let error = error {
                print("MEX: Error updating user photo URL: ", error)
            } else {
                print("MEX: User photo URL updated successfully")
            }
        }
    }
}

extension UIImage {
    func aspectFittedToHeight(_ newHeight: CGFloat) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}
