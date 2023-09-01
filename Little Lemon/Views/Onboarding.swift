//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Александр Карпов on 31.08.2023.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kPhone = "phone key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    
    @State var isLoggedIn = false
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                
                OnboardingHero()
                
                VStack(alignment: .leading) {
                    Group {
                        Text("First Name")
                            .foregroundColor(Color(greenLemonColor))
                            .font(Font.custom("Karla", size: 18))
                            .fontWeight(.medium)
                        TextField("First Name", text: $firstName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 10)
                    }
                    Group {
                        Text("Last Name")
                            .foregroundColor(Color(greenLemonColor))
                            .font(Font.custom("Karla", size: 18))
                            .fontWeight(.medium)
                        TextField("Last Name", text: $lastName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 10)
                    }
                    Group {
                        Text("Email")
                            .foregroundColor(Color(greenLemonColor))
                            .font(Font.custom("Karla", size: 18))
                            .fontWeight(.medium)
                        TextField("Email", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.emailAddress)
                            .padding(.bottom, 10)
                    }
                }
                .padding()
                Button {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    }
                } label: {
                    Text("Register")
                        .frame(width: 200)
                        .foregroundColor(.black)
                        .font(Font.custom("Karla", size: 16))
                        .fontWeight(.black)
                        .padding()
                }
                .background(Color(yelowLemonColor))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.bottom)
                
                Spacer()
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) == true {
                    isLoggedIn = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
