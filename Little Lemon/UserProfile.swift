//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Александр Карпов on 31.08.2023.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastName)
    let email = UserDefaults.standard.string(forKey: kEmail)
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: .center)
            Text(firstName ?? "Name")
            Text(lastName ?? "Surname")
            Text(email ?? "email")
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
