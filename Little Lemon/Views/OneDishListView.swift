//
//  OneDishListView.swift
//  Little Lemon
//
//  Created by Александр Карпов on 31.08.2023.
//

import SwiftUI

struct OneDishListView: View {
    let dish: Dish
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(dish.title ?? "Title")
                        .foregroundColor(.black)
                        .font(Font.custom("Karla", size: 18))
                        .fontWeight(.bold)
                    
                    Text(dish.about ?? "about")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(greenLemonColor))
                        .font(Font.custom("Karla", size: 16))
                        .fontWeight(.regular)
                        .lineLimit(2)
                        .padding(.vertical, 10)
                    Text("$" + (dish.price ?? "12.99"))
                        .foregroundColor(Color(greenLemonColor))
                        .font(Font.custom("Karla", size: 18))
                        .fontWeight(.medium)
                }
                Spacer()
                AsyncImage(url: URL(string: dish.image!)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 83, height: 83, alignment: .center)
                .clipped()
                .padding(.leading, 20)
                
            }
            Divider()
        }
        .padding(.horizontal)
    }
}

struct OneDishListView_Previews: PreviewProvider {
    static var previews: some View {
        OneDishListView(dish: Dish(context: PersistenceController.shared.container.viewContext))
    }
}
