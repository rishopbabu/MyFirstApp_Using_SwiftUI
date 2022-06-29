//
//  RegViewModel.swift
//  MyFirstApp
//
//  Created by MAC-OBS-26 on 01/03/22.
//

import Foundation
import Combine

class RegViewModel: ObservableObject {
    
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var email = ""
    @Published var username = ""
    @Published var age = ""
    @Published var password = ""
    @Published var confirmpassword = ""
    
    
    @Published var isFirstNameValid = false
    @Published var isLastNameValid = false
    @Published var isEmailValid = false
    @Published var isUserNameValid = false
    @Published var isAgeValid = false
    @Published var isPasswordValid = false
    @Published var isConfirmPasswordValid = false
    @Published var canSubmit = false
    private var cancelableSet: Set<AnyCancellable> = []
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
//    let confirmPasswordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
    let namePredicate = NSPredicate(format: "SELF MATCHES %@", "^\\w{3,18}$")
//    let lastnamePredicate = NSPredicate(format: "SELF MATCHES %@", "^\\w{3,18}$")
//    let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", "^\\w{3,18}$")
    let agePredicate = NSPredicate(format: "SELF MATCHES %@", "^[0-9]\\d{9}$")
    
    init() {
        $email
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancelableSet)
        
        $password
            .map { password in
                return self.passwordPredicate.evaluate(with: password)
            }
            .assign(to: \.isPasswordValid, on: self)
            .store(in: &cancelableSet)
        
        $age
            .map { age in
                return self.agePredicate.evaluate(with: age)
            }
            .assign(to: \.isAgeValid, on: self)
            .store(in: &cancelableSet)
        
        $firstname
            .map { firstname in
                return self.namePredicate.evaluate(with: firstname)
            }
            .assign(to: \.isFirstNameValid, on: self)
            .store(in: &cancelableSet)
        
        $lastname
            .map { lastname in
                return self.namePredicate.evaluate(with: lastname)
            }
            .assign(to: \.isLastNameValid, on: self)
            .store(in: &cancelableSet)
        
        $username
            .map { username in
                return self.namePredicate.evaluate(with: username)
            }
            .assign(to: \.isUserNameValid, on: self)
            .store(in: &cancelableSet)
        
        Publishers.CombineLatest($password, $confirmpassword)
            .map { password, confirmpassword in
                return password == confirmpassword
            }
            .assign(to: \.isConfirmPasswordValid, on: self)
            .store(in: &cancelableSet)
        
        Publishers.CombineLatest4($isUserNameValid, $isEmailValid, $isPasswordValid, $isConfirmPasswordValid)
            .map { isUserNameValid, isEmailValid, isPasswordValid, isConfirmPasswordValid in
                return(isUserNameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancelableSet)
    }
    
    var emailPrompt: String {
        isEmailValid ?
        ""
        :
        "enter a valid email"
    }
    
    var usernamePrompt: String {
        isUserNameValid ?
        ""
        :
        "enter a valid username"
    }
    
    var passwordPrompt: String {
        isPasswordValid ?
        ""
        :
        "Must be atleast 8 chars contains atleast 1 number 1 letter and 1 special cahracter"
    }
    
    var confirmpasswordPrompt: String {
        isConfirmPasswordValid ?
        ""
        :
        "Password Fiels do not match"
    }
    
    var agePrompt: String {
        isAgeValid ?
        ""
        :
        "Age must be above 18 and contains only numbers"
    }
    
    var firstPrompt: String {
        isFirstNameValid ?
        ""
        :
        "enter a valid first name"
    }
    
    var lastnamePrompt: String {
        isLastNameValid ?
        ""
        :
        "enter a valid last name"
    }
    
    func login() {
        print("Logging in \(username)")
        firstname = ""
        lastname = ""
        email = ""
        username = ""
        age = ""
        password = ""
        confirmpassword = ""
    }
}
