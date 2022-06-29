//
//  ForgotUsernameView.swift
//  MyFirstApp
//
//  Created by MAC-OBS-26 on 15/03/22.
//

import SwiftUI

struct ForgotUsernameView: View {
    
    @State private var emailId = ""
    @State private var passWord = ""
    @State private var showingUsernameScreen = false
    
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
                Text("Get Username")
                    .bold()
                    .font(.largeTitle)
                TextField("Enter Email Id", text: $emailId)
                    .padding()
                    .frame(width: 350, height:50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(25.0)
                SecureField("Enter Password", text: $passWord)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(25.0)
                
                NavigationLink(destination: Text("Your user name is "), isActive: $showingUsernameScreen) {
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

struct ForgotUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotUsernameView()
    }
}
