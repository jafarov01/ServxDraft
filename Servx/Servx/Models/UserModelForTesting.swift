//
//  UserModelForTesting.swift
//  Servx
//
//  Created by Makhlug Jafarov on 07/12/2023.
//

import Foundation
import Firebase

class UserModelForTesting {
    func generateRandomUser(completion: @escaping (UserModel?, Error?) -> Void) {
        let fullName = generateRandomString(length: 10)
        let phoneNumber = generateRandomPhoneNumber()
        let email = generateRandomEmail()
        let photoURL = generateRandomImageURL()
        let address = generateRandomAddress()
        let password = generateRandomPassword()
        let isCustomerOnly = Bool.random()
        
        var testUser = UserModel(id: "1", fullName: fullName, phoneNumber: phoneNumber, email: email, photoURL: photoURL, address: address, isCustomerOnly: isCustomerOnly, createdAt: Timestamp())
        
        // create the user in the firebase authentication
        AuthenticationManager.shared.createUser(email: email, password: password) { authResult, error in
            if let error = error {
                print("MEX Error creating user: \(error)")
                completion(nil, error)
            } else if let authResult = authResult {
                print("MEX success user registering on the authentication")
                testUser = UserModel(id: authResult.user.uid, fullName: fullName, phoneNumber: phoneNumber, email: email, photoURL: photoURL, address: self.generateRandomAddress(), isCustomerOnly: isCustomerOnly, createdAt: Timestamp())
                
                let userRef = Firestore.firestore().collection("users").document(authResult.user.uid)
                
                do {
                    let userDictionary = try Firestore.Encoder().encode(testUser)
                    userRef.setData(userDictionary) { error in
                        if let error = error {
                            print("MEX Error setting user data: \(error.localizedDescription)")
                            completion(nil, error)
                        } else {
                            print("MEX success user data saving")
                            completion(testUser, nil)
                        }
                    }
                } catch let error {
                    print("MEX Error encoding AuthenticatedUser.shared: \(error.localizedDescription)")
                    completion(nil, error)
                }
            } else {
                // Handle unexpected error internally
                print("MEX Unexpected error during user creation")
                completion(nil, NSError(domain: "Authentication", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected error during user creation"]))
            }
        }
    }
    
    
    func generateRandomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
    
    func generateRandomPhoneNumber() -> String {
        let randomDigits = (0..<10).map { _ in String(Int.random(in: 0...9)) }
        return "+1" + randomDigits.joined()
    }
    
    
    func generateRandomEmail() -> String {
        let firstName = generateRandomString(length: 8)
        let lastName = generateRandomString(length: 8)
        let domain = "example.com"
        
        return "\(firstName)\(lastName)@\(domain)"
    }
    
    func generateRandomImageURL() -> String {
        let imageNames = ["image1.jpg", "image2.jpg", "image3.jpg"]
        return imageNames.randomElement()!
    }
    
    func generateRandomAddress() -> Address {
        let address = generateRandomString(length: 10)
        let state = generateRandomString(length: 2)
        let zipCode = String(format: "%05d", Int.random(in: 100000...999999))
        
        return Address(state: state, address: address, zipCode: zipCode)
    }
    
    func generateRandomPassword() -> String {
        let lowercaseLetters = "abcdefghjklmnopqrstuvwxyz"
        let uppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let numbers = "0123456789"
        let specialCharacters = "~!@#$%^&*()_+-=[]{}|;':\",.<>/?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        return String((0..<12).map { _ in
            let char = lowercaseLetters.randomElement()!
            let randomIndex = Int.random(in: 0..<4)
            
            if randomIndex == 0 {
                return char
            } else if randomIndex == 1 {
                return uppercaseLetters.randomElement()!
            } else if randomIndex == 2 {
                return numbers.randomElement()!
            } else {
                return specialCharacters.randomElement()!
            }
        })
    }
}
