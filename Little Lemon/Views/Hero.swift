//
//  Hero.swift
//  Little Lemon
//
//  Created by Александр Карпов on 31.08.2023.
//

import SwiftUI

let yelowLemonColor = "yellowLemon"
let greenLemonColor = "greenLemon"

struct Hero: View {
    
    @Binding var searchText: String
    
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
                    .font(Font.custom("Karla", size: 18))
                    .fontWeight(.medium)
                    Image("Img_pop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                }
                .offset(y: -30)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .circular)
                        .foregroundColor(.white)
                        .frame(height: 50)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        TextField("Search", text: $searchText)
                        if !searchText.isEmpty {
                            Image(systemName: "multiply")
                                .foregroundColor(.gray)
                                .padding(.trailing)
                                .onTapGesture {
                                    searchText = ""
                                }
                        }
                    }
                }
                .offset(y: -20)


            }
            .padding()
        }
    }
}

//struct Hero_Previews: PreviewProvider {
//    static var previews: some View {
//        Hero(searchText: Binding<String>)
//    }
//}
