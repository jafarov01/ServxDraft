//
//  Bookmark.swift
//  Servx
//
//  Created by Makhlug Jafarov on 11/12/2023.
//

import Foundation

class Bookmark: Codable {
    let bookmarkID: String
    let serviceProviderPostReferenceID: String //the serviceProviderPostID which was bookmarked

    init(bookmarkID: String, serviceProviderPostReferenceID: String) {
        self.bookmarkID = bookmarkID
        self.serviceProviderPostReferenceID = serviceProviderPostReferenceID
    }
}
