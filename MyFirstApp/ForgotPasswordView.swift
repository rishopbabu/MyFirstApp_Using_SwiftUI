//
//  ForgotPasswordView.swift
//  MyFirstApp
//
//  Created by MAC-OBS-26 on 11/03/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var userName = ""
    @State private var emailId = ""
    @State private var newPassword = ""
    @State private var confirmNewPassword = ""
    @State private var showingPasswordResetScreen = false
    
    var body: some View {
        ZStack {
            Color.init(red: 0.112, green: 0.112, blue: 0.25)
                .ignoresSafeArea()
            Circle()
                .scale(1.9)
                .foregroundColor(Color.init(red: 0.132, green: 0.132, blue: 0.45))
            Circle()
                .scale(1.5)
                .foregroundColor(.white)
            VStack {
                Text("Reset Password")
                    .bold()
                    .font(.largeTitle)
                TextField("Enter Username", text: $userName)
                    .padding()
                    .frame(width: 350, height:50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(25.0)
                TextField("Enter Email Id", text: $emailId)
                    .padding()
                    .frame(width: 350, height:50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(25.0)
                SecureField("Enter New Password", text: $newPassword)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(25.0)
                SecureField("Re-enter the New Password", text: $confirmNewPassword)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(25.0)
                
                NavigationLink(destination: Text("You Password reseted successfully @\(userName)"), isActive: $showingPasswordResetScreen) {
                    EmptyView()
                }
                
                Button("Submit") {
                    
                }
                .padding()
                .foregroundColor(.white)
                .frame(width: 150, height: 50)
                .background(Color.init(red: 0.112, green: 0.112, blue: 0.25))
                .cornerRadius(25.0)
                .shadow(radius: 5)
                .padding()
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
