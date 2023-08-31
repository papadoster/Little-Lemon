//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Александр Карпов on 31.08.2023.
//

import SwiftUI

struct UserProfile: View {
    
    @State var firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var email: String = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var phone: String = UserDefaults.standard.string(forKey: kPhone) ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack(alignment: .leading) {
                    Text("Personal information")
                        .foregroundColor(.black)
                        .font(Font.custom("Karla", size: 26))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                    Text("Avatar")
                        .foregroundColor(Color(greenLemonColor))
                        .font(Font.custom("Karla", size: 18))
                        .fontWeight(.medium)
                    HStack {
                        Image("profile-image-placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .clipShape(Circle())
                        
                        
                        Button {
                            
                        } label: {
                            Text("Change")
                                .foregroundColor(.white)
                                .font(Font.custom("Karla", size: 16))
                                .fontWeight(.black)
                                .padding()
                        }
                        .background(Color(greenLemonColor))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.leading)
                        
                        Button(action: {
                            
                        }) {
                            Text("Remove")
                                .frame(minWidth: 0, maxWidth: 80)
                                .font(Font.custom("Karla", size: 16))
                                .fontWeight(.black)
                                .padding()
                                .foregroundColor(Color(greenLemonColor))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(greenLemonColor), lineWidth: 2)
                                )
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        Spacer()
                    }
                    Group {
                        Text("First Name")
                            .foregroundColor(Color(greenLemonColor))
                            .font(Font.custom("Karla", size: 18))
                            .fontWeight(.medium)
                            .padding(.top, 7)
                        TextField(firstName.isEmpty ? "First Name" : firstName, text: $firstName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 7)
                    }
                    Group {
                        Text("Last Name")
                            .foregroundColor(Color(greenLemonColor))
                            .font(Font.custom("Karla", size: 18))
                            .fontWeight(.medium)
                        TextField(lastName.isEmpty ? "Last Name" : lastName, text: $lastName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 7)
                    }
                    Group {
                        Text("Email")
                            .foregroundColor(Color(greenLemonColor))
                            .font(Font.custom("Karla", size: 18))
                            .fontWeight(.medium)
                        TextField(email.isEmpty ? "email" : email , text: $email)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.emailAddress)
                            .padding(.bottom, 7)
                    }
                    Group {
                        Text("Phone")
                            .foregroundColor(Color(greenLemonColor))
                            .font(Font.custom("Karla", size: 18))
                            .fontWeight(.medium)
                        TextField(phone.isEmpty ? "Phone" : phone, text: $phone)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .padding(.bottom, 7)
                    }
                    
                }
                VStack {
                    
                    HStack {
                        Button(action: {
                            firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
                            lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
                            email = UserDefaults.standard.string(forKey: kEmail) ?? ""
                            phone = UserDefaults.standard.string(forKey: kPhone) ?? ""
                        }) {
                            Text("Discard changes")
                                .frame(width: 130)
                                .font(Font.custom("Karla", size: 16))
                                .fontWeight(.medium)
                                .padding()
                                .foregroundColor(Color(greenLemonColor))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(greenLemonColor), lineWidth: 2)
                                )
                        }
                        .background(Color.white) // If you have this
                        .cornerRadius(10)
                        
                        Button {
                            if !firstName.isEmpty {
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                            }
                            if lastName.isEmpty {
                                UserDefaults.standard.set(lastName, forKey: kLastName)
                            }
                            if !email.isEmpty {
                                UserDefaults.standard.set(email, forKey: kEmail)
                            }
                            if !phone.isEmpty {
                                UserDefaults.standard.set(phone, forKey: kPhone)
                            }
                            
                            
                        } label: {
                            Text("Save changes")
                                .frame(width: 130)
                                .foregroundColor(.white)
                                .font(Font.custom("Karla", size: 16))
                                .fontWeight(.medium)
                                .padding()
                        }
                        .background(Color(greenLemonColor))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        
                    }
                    
                    Button {
                        UserDefaults.standard.removeObject(forKey: kPhone)
                        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("Log out")
                            .frame(width: 200)
                            .foregroundColor(.black)
                            .font(Font.custom("Karla", size: 16))
                            .fontWeight(.black)
                            .padding()
                    }
                    .background(Color(yelowLemonColor))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
                }
                .padding()
            }
        }
        .onAppear(perform: {
            firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
            lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
            email = UserDefaults.standard.string(forKey: kEmail) ?? ""
            phone = UserDefaults.standard.string(forKey: kPhone) ?? ""
        })
        .padding()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
