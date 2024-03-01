//
//  OTPForgotPasswordView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/10/2023.
//

import Foundation
import SwiftUI
import Combine

struct SendOTPView: View {
    
    @StateObject var timerManager = TimerManager()
    @StateObject var viewModel = SendOTPViewViewModel()
    
    var body: some View {
        VStack {
            HStack {
                ServxTextView(text: "You've got email", fontStyle: "Poppins", fontSize: 24, fontColor: Color("primary500Color"), isBold: true, isItalic: false, textAlignment: .center)
                Image("authEmailImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            
            ServxTextView(text: "We have sent the OTP verification code to your email address. Check your email and enter the code below", fontStyle: "Poppins", fontSize: 16, fontColor: Color("greyscale400Color"), isBold: true, isItalic: false, textAlignment: .center)
                .padding()
            
            Button(action: {
                timerManager.startTimer(seconds: 60)
            }) {
                Text("Start Countdown")
            }
            
            OTPInputBlock(numberOfFields: 4)
            
            ServxTextView(text: "Didn’t recive email", fontStyle: "Poppins", fontSize: 12, fontColor: Color("greyscale400Color"), isBold: true, isItalic: false, textAlignment: .center)
                .padding()
            
            ServxTextView(text: "You can resend code in \(timerManager.remainingSeconds) s", fontStyle: "Poppins", fontSize: 14, fontColor: Color("greyscale400Color"), isBold: true, isItalic: false, textAlignment: .center)
                .padding()
            
            ServxButtonView(height: 56, width: 342, handler: {
                viewModel.verifyOTP { isMatching in
                    if isMatching {
                        print("MEX all good OTP matches")
                    } else {
                        print("MEX otp does not match :)")
                    }
                }
            }, label: "Continue", textColor: Color("othersWhiteColor"), backgroundColor: Color("primary200Color"))
        }
    }
}

class TimerManager: ObservableObject {
    @Published var remainingSeconds: Int = 0
    private var timer: Timer?
    
    func startTimer(seconds: Int) {
        remainingSeconds = seconds
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self, self.remainingSeconds > 0 else {
                self?.timer?.invalidate()
                return
            }
            self.remainingSeconds -= 1
        }
    }
}

#Preview {
    SendOTPView()
}
