//
//  ContentView.swift
//  MyFirstApp
//
//  Created by MAC-OBS-26 on 10/02/22.
//

import SwiftUI
import Foundation

//home page
struct ContentView: View {
    
    //login and signup button action
    @State private var isShowingDetailView = false
    
    //variables for login text fields
    @State private var userName = ""
    @State private var passWord = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        
        
        ScrollView {
            VStack {
                Text("Welcome")
                    .bold()
                    .font(.largeTitle)
                    //.frame(width: UIScreen.main.bounds.width * 0.9)
                
//                GifImage("Gif_Image")
//                    //.frame(width: UIScreen.main.bounds.width * 0.9)
//                    .padding()
                Image("apple")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    TextField("User Name", text: $userName)
                        .padding()
                        //.frame(width: 350, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(25.0)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $passWord)
                        .padding()
                        //.frame(width: 350, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(25.0)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    NavigationLink(destination: Text("You are successfully login @\(userName)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                    
                    Button("Login") {
                        authenticateUser(username: userName, password: passWord)
                    }
                    
                    //.padding()
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Color.init(red: 0.112, green: 0.112, blue: 0.25))
                    .cornerRadius(25.0)
                    .shadow(radius: 5)
                    .padding()
                    
                    NavigationLink(destination: ForgotPasswordView()) {
                        
                        Text("Forgot Password?")
                            .font(.title3)
                            .italic()
                            .foregroundColor(Color.init(red: 0.112, green: 0.112, blue: 0.25))

                    }
                    NavigationLink(destination: ForgotUsernameView()) {
                        Text("Forgot Username?")
                            .font(.title3)
                            .italic()
                            .padding()
                            .foregroundColor(Color.init(red: 0.112, green: 0.112, blue: 0.25))
                    }
                    
                    
                    NavigationLink(destination: SignupView(), isActive: $isShowingDetailView) {}
                    Button(action: {isShowingDetailView = true}) {
                        Text("Create an Account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 190, height: 50)
                            .background(Color.init(red: 0.112, green: 0.112, blue: 0.25))
                            .cornerRadius(25.0)
                            .shadow(radius: 5)
                    }
                }
                .padding(0.3)
                Text("or")
                Text("Sign Up With")
                    .frame(width:330, height: 50)
                    .background(Color.white)
                    .cornerRadius(25.0)
                
                HStack {
                    Button(action: { if let yourURL = URL(string: "https://www.google.com/") {
                        UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                    }}) {
                        Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 60)
                            //.cornerRadius(50)
                            .padding()
                    }
                    Button(action: { if let yourURL = URL(string: "https://www.facebook.com/") {
                        UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                    }})  {
                        Image("facebook")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 60)
                            //.cornerRadius(50)
                            .padding()
                    }
                    Button(action: { if let yourURL = URL(string: "https://www.twitter.com/") {
                        UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                    }}) {
                        Image("twitter")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 60)
                            //.cornerRadius(50)
                            .padding()
                    }
    
                    Button(action: { if let yourURL = URL(string: "https://www.apple.com/") {
                        UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                    }}) {
                        Image("apple")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 60)
                            //.cornerRadius(50)
                            .padding()
                    }
                }
            }
        
    }
    }
    
    func authenticateUser(username: String, password: String) {
        print("Button is pressed")
            if username == "Rishop" {
                wrongUsername = 0
                if password == "12345" {
                    wrongPassword = 0
                    showingLoginScreen = true
                }
                else {
                    wrongPassword = 2
                }
            }
            else {
                wrongUsername = 2
            }
        }
    
}


//for preview screen
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
