//
//  Validation.swift
//  MyFirstApp
//
//  Created by MAC-OBS-26 on 16/03/22.
//

import Foundation

class Validation {
    
    public func validateFirstName(firstName: String) -> Bool {
        let trimmedString = firstName.trimmingCharacters(in: .whitespaces)
        let validateFirstName = NSPredicate(format: "SELF MATCHES %@", "^\\w{3,18}$")
        let isValidateFirstName = validateFirstName.evaluate(with: trimmedString)
        return isValidateFirstName
    }
    
    public func validateLastName(lastName: String) -> Bool {
        let trimmedString = lastName.trimmingCharacters(in: .whitespaces)
        let validateLastName = NSPredicate(format: "SELF MATCHES %@", "^\\w{3,18}$")
        let isValidateLastName = validateLastName.evaluate(with: trimmedString)
        return isValidateLastName
    }
    
    public func validateUserName(userName: String) -> Bool {
        let trimmedString = userName.trimmingCharacters(in: .whitespaces)
        let validateUserName = NSPredicate(format: "SELF MATCHES %@", "^\\w{3,18}$")
        let isValidateUserName = validateUserName.evaluate(with: trimmedString)
        return isValidateUserName
    }
    
    public func validatePhoneNumber(phoneNumber: String) -> Bool {
          let trimmedString = phoneNumber.trimmingCharacters(in: .whitespaces)
          let validatePhone = NSPredicate(format: "SELF MATCHES %@", "^\\d{10}$")
          let isValidPhone = validatePhone.evaluate(with: trimmedString)
          return isValidPhone
       }
    
    public func validateEmailId(emailID: String) -> Bool {
          let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
          let validateEmail = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
          let isValidateEmail = validateEmail.evaluate(with: trimmedString)
          return isValidateEmail
       }
    
    public func validatePassword(password: String) -> Bool {
          //Minimum 8 characters at least 1 Alphabet and 1 Number:
          let trimmedString = password.trimmingCharacters(in: .whitespaces)
          let validatePassord = NSPredicate(format:"SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
          let isvalidatePass = validatePassord.evaluate(with: trimmedString)
          return isvalidatePass
       }
    
    public func validateConfirmPassword(confirmPassword: String) -> Bool {
          //Minimum 8 characters at least 1 Alphabet and 1 Number:
          let trimmedString = confirmPassword.trimmingCharacters(in: .whitespaces)
          let validateConfirmPassword = NSPredicate(format:"SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
          let isvalidateConfirmPassword = validateConfirmPassword.evaluate(with: trimmedString)
          return isvalidateConfirmPassword
       }
}
