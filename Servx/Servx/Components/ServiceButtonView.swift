//
//  ServiceButton.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/10/2023.
//

import Foundation
import SwiftUI

struct ServiceButtonView: View {
    var image: String
    var handler: () -> Void

    var body: some View {
        Button(action: handler) {
            Image(image)
                .frame(width: 36, height: 36)
        }
    }
}
