//
//  CategoriesView.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject var categoriesViewModel: CategoryViewModel = CategoryViewModel()
    @State var errorMessage = ""
    @State var alertError = false
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(categoriesViewModel.categories.sorted(by: {$0.strCategory ?? "" < $1.strCategory ?? ""}), id: \.idCategory) { cat in
                            NavigationLink {
                                MealsView(mealsViewModel: MealViewModel(category: cat))
                            } label: {
                                VStack {
                                    AsyncImage(url: URL(string: cat.strCategoryThumb ?? ""))
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                    
                                    Text(cat.strCategory ?? "")
                                }
                                .padding(5)
                            }.foregroundColor(.black)
                            
                        }
                    }
                }.alert(errorMessage, isPresented: $alertError) {
                    Button {
                        alertError = false
                    } label: {
                        Text("OK")
                    }
                    
                }
                if categoriesViewModel.loading {
                    ProgressView()
                }
            }
        }
        .navigationTitle(Text("Categories"))
        .task {
            do {
                try await categoriesViewModel.loadCategories()
            } catch {
                errorMessage = error.localizedDescription
                alertError = true
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
