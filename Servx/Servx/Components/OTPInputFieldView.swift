//
//  OTPInputFieldView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 16/10/2023.
//

import Foundation
import SwiftUI

struct OTPInputBlock: View {
    @StateObject var viewModel = SendOTPViewViewModel()
    let numberOfFields: Int

    @State var enteredOTP: [String]
    @FocusState private var fieldFocus: Int?
    @State private var oldValue = ""

    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.enteredOTP = Array(repeating: "", count: numberOfFields)
    }

    var body: some View {
        HStack {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $enteredOTP[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = enteredOTP[index]
                    }
                })
                .keyboardType(.numberPad)
                .frame(width: 48, height: 48)
                .background(.yellow)
                .cornerRadius(5)
                .multilineTextAlignment(.center)
                .focused($fieldFocus, equals: index)
                .tag(index)
                .onChange(of: enteredOTP[index]) { newValue in
                    if enteredOTP[index].count > 1 {
                        let currentValue = Array(enteredOTP[index])

                        if currentValue[0] == Character(oldValue) {
                            enteredOTP[index] = String(enteredOTP[index].suffix(1))
                        } else {
                            enteredOTP[index] = String(enteredOTP[index].prefix(1))
                        }
                    }

                    if !newValue.isEmpty {
                        if index == numberOfFields - 1 {
                            fieldFocus = nil
                        } else {
                            fieldFocus = (fieldFocus ?? 0) + 1
                        }
                    }
                }
            }
        }
        .onChange(of: enteredOTP) { newValues in
                    viewModel.enteredOTP = newValues.joined()
                }
    }
}
