//
//  SignUpView.swift
//  MyFirstApp
//
//  Created by MAC-OBS-26 on 10/02/22.
//

import SwiftUI
import Foundation

//home page
struct SignupView: View {
    
    
    //section-1 firstname, lastname, username, emailid
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var userName = ""
    @State private var birthdate = Date()
    //for age
    @State private var age: String = "1"
    @State private var isScroolExpanded = false
    //for gender descriptons
    let genders = ["Male", "Female", "Others"]
    @State private var selectgender = 0
    
    //section-2 country code, name and number
    @State private var countrycode = ""
    @State private var countryname = ""
    @State private var phoneNumber = ""
    @State private var emailId = ""
    
    //section-3 set password
    @State private var password = ""
    @State private var confirmpassword = ""
    
    
    //section-4 Actions
    //Update via email
    @State private var sendUpdatesViaMail = false
    @State private var acceptTermsandConditions = false
    
    var validation = Validation()
    
    var body: some View {
        NavigationView {
            Form {
                //section 1
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $firstName) .disableAutocorrection(true)
                    TextField("Last Name", text: $lastName) .disableAutocorrection(true)
                    TextField("User Name", text: $userName) .disableAutocorrection(true)
                    DatePicker("Date of Birth",  selection: $birthdate, displayedComponents: .date)
                    Picker(selection: $age,
                           label: Text("Select Age"),
                           content: {
                        ForEach(18..<31) { number in
                            Text("\(number)").tag("\(number)")
                        }
                    })
                    
                    HStack {
                        Text("Select Gender")
                        Picker("", selection: $selectgender) {
                            ForEach(0..<genders.count) { index in
                                Text(self.genders[index]).tag(index).font(.title)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                //section 2
                Section(header: Text("Contact Details")) {
                    HStack {
                        TextField("Code", text: $countrycode) .disableAutocorrection(true) .frame(width: 70)
                        TextField("Country Name", text: $countryname) .disableAutocorrection(true)
                    }
                    TextField("Phone Number", text: $phoneNumber) .disableAutocorrection(true)
                    TextField("e-Mail Id", text: $emailId) .disableAutocorrection(true)
                }
                
                //Section 3
                Section(header: Text("Set Password")) {
                    SecureField("Enter Password", text: $password) .disableAutocorrection(true)
                    SecureField("Confirm Password", text: $confirmpassword) .disableAutocorrection(true)
                }
                //section 4
                Section(header: Text("Actions")) {

                    Toggle("Send Updates via e-Mail", isOn: $sendUpdatesViaMail)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Link("Terms and Conditions", destination: URL(string: "https://www.google.com/")!)
                    Toggle("Accept Terms and Conditions", isOn: $acceptTermsandConditions)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                }
                
                VStack(alignment: .center) {
                    Button("Submit") {
                        
                        let fname = firstName
                        let lname = lastName
                        let uname = userName
                        let pno = phoneNumber
                        let email = emailId
                        let pass = password
                        let cpass = confirmpassword
                        
                        let isValidFirstName = self.validation.validateFirstName(firstName: fname)
                        if (isValidFirstName == false) {
                            print("Incorrect First Name")
                            return
                        }
                        
                        let isValidateLastName = self.validation.validateLastName(lastName: lname)
                        if (isValidateLastName == false) {
                            print("Incorrecr Last Name")
                            return
                        }
                        
                        let isValidateUserName = self.validation.validateUserName(userName: uname)
                        if (isValidateUserName == false) {
                            print("Incorrecr User Name")
                            return
                        }
                        
                        let isValidatePhoneNumber = self.validation.validatePhoneNumber(phoneNumber: pno)
                        if (isValidatePhoneNumber == false) {
                            print("Incorrect Phone Number")
                            return
                        }
                        
                        let isValidateEmailId = self.validation.validateEmailId(emailID: email)
                        if (isValidateEmailId == false) {
                            print("Incorrect Email Id")
                            return
                        }
                        
                        let isValidatePassword = self.validation.validatePassword(password: pass)
                        if (isValidatePassword == false) {
                            print("Invalid Password length or character")
                            return
                        }
                        
                        let isValidateConfirmPassword = self.validation.validateConfirmPassword(confirmPassword: cpass)
                        if (isValidateConfirmPassword == false) {
                            print("Password Miss Match")
                            return
                        }
                        
                        if(isValidFirstName == true || isValidateLastName == true || isValidateUserName == true || isValidatePhoneNumber == true || isValidateEmailId == true ||
                           isValidatePassword == true || isValidateConfirmPassword == true) {
                            print("All fields are correct")
                        }
                        
                    }
                    
//                    Button(action: {}) {
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(height: 50)
//                            .overlay(Text("Submit") .foregroundColor(.white))
//                    }
//                    .padding()
                    
                }
            }.navigationBarTitle("Create Account") .accentColor(.red)
        }
    }
}


//for preview screen
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        SignupView()
        }
    }
}
