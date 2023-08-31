//
//  Menu.swift
//  Little Lemon
//
//  Created by Александр Карпов on 31.08.2023.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "category", ascending: true, selector: #selector(NSString.localizedStandardCompare))],
                  animation: .default)
    var category: FetchedResults<Dish>
    
    @State var searchText: String = ""
    @State var selectedCategory: String = ""
    
    var body: some View {
            VStack {
                ZStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    HStack {
                        Spacer()
                        NavigationLink {
                            UserProfile()
                        } label: {
                            Image("profile-image-placeholder")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                                .clipShape(Circle())
                                .padding(.horizontal)
                        }
                    }
                }
                
                ScrollView {
                    Hero(searchText: $searchText)
                    
                    VStack(alignment: .leading) {
                        Text("Order for Delivery!".uppercased())
                            .foregroundColor(.black)
                            .font(Font.custom("Karla", size: 20))
                            .fontWeight(.black)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Array(Set(category.compactMap { $0.category })).sorted(), id: \.self) { cat in
                                    Button {
                                        
                                        if selectedCategory != cat {
                                            selectedCategory = cat
                                        } else if selectedCategory == cat {
                                            selectedCategory = ""
                                        }
                                        
                                    } label: {
                                        Text(cat.capitalized)
                                            .foregroundColor(Color(greenLemonColor))
                                            .font(Font.custom("Karla", size: 16))
                                            .fontWeight(.black)
                                            .padding(10)
                                    }
                                    .background(cat == selectedCategory ? Color(yelowLemonColor).opacity(0.8) : Color(.gray).opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                                
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                    
                    FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {  (dishes2: [Dish]) in
                        
                        VStack {
                            Divider().padding(.horizontal)
                            ForEach(dishes2) { dish in
                                NavigationLink {
                                    
                                } label: {
                                    OneDishListView(dish: dish)
                                }
                            }
                        }
                    }
                }
            }
        .onAppear {
            selectedCategory = ""
            getMenuData()
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) == false {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
    
    func getMenuData() {
//        PersistenceController.shared.clear()
        
        if category.isEmpty {
            let urlString: String = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
            let url = URL(string: urlString)!
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let result = try? decoder.decode(MenuList.self, from: data) {
                        for item in result.menu {
                            let dish = Dish(context: viewContext)
                            dish.title = item.title
                            dish.price = item.price
                            dish.category = item.category
                            dish.about = item.description
                            dish.image = item.image
                            try? viewContext.save()
                        }
                    }
                    
                }
            }
            task.resume()
        }
        
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty && selectedCategory.isEmpty {
            return NSPredicate(value: true)
        } else if searchText.isEmpty && !selectedCategory.isEmpty {
            return NSPredicate(format: "category CONTAINS[cd] %@", selectedCategory)
        } else if !searchText.isEmpty && selectedCategory.isEmpty {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        } else {
            return NSPredicate(format: "(category CONTAINS[cd] %@) AND (title CONTAINS[cd] %@)", selectedCategory, searchText)
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
