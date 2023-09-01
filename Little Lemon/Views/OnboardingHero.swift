//
//  OnboardingHero.swift
//  Little Lemon
//
//  Created by Александр Карпов on 01.09.2023.
//

import SwiftUI

struct OnboardingHero: View {
    var body: some View {
        ZStack {
            Color(greenLemonColor)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Little Lemon")
                    .foregroundColor(Color(yelowLemonColor))
                    .font(Font.custom("MarkaziText-Medium", size: 64))
                Text("Chicago")
                    .foregroundColor(.white.opacity(0.8))
                    .font(Font.custom("MarkaziText-Medium", size: 40))
                    .offset(y: -20)
                HStack(alignment: .top) {
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .foregroundColor(.white)
                    .font(Font.custom("Karla", size: 16))
                    .fontWeight(.regular)
                    .padding(.trailing, 10)
                    Image("Img_pop")
                        .resizable()
                        .scaledToFit()
                        .frame(height:  115)
                }
                .offset(y: -30)

            }
            .padding()
        }
    }
}

struct OnboardingHero_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingHero()
    }
}
