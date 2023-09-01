//
//  MenuItemDetailView.swift
//  Little Lemon
//
//  Created by Александр Карпов on 01.09.2023.
//

import SwiftUI

struct MenuItemDetailView: View {
    let dish: Dish
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: dish.image!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
                    .frame(height: 400)
            }
            .frame(height: 400, alignment: .top)
            .padding(.leading, 30)
            
            VStack(alignment: .leading) {
                
            Text(dish.title ?? "Title")
                .foregroundColor(.black)
                .font(Font.custom("Karla", size: 36))
                .fontWeight(.bold)
            
            Text(dish.about ?? "about")
                .multilineTextAlignment(.leading)
                .foregroundColor(Color(greenLemonColor))
                .font(Font.custom("Karla", size: 18))
                .fontWeight(.regular)
                .padding(.vertical, 10)
                .padding(.trailing, 30)
            Text("Price: $" + (dish.price ?? "12.99"))
                .foregroundColor(Color(greenLemonColor))
                .font(Font.custom("Karla", size: 24))
                .fontWeight(.medium)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

//struct MenuItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuItemDetailView()
//    }
//}
