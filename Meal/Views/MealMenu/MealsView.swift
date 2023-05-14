//
//  MealsView.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI

struct MealsView: View {
    @StateObject var mealsViewModel: MealViewModel
    @State var search = ""
    @State var info = false
    @State var errorMessage = ""
    @State var alertError = false // alert user with error
    var body: some View {
        VStack {
            ZStack {
                List {
                    MealMenuHeaderView(mealsViewModel: mealsViewModel)
                    Section("Meals in \(mealsViewModel.category?.strCategory ?? " Category")") {
                        ForEach(search.isEmpty ?  mealsViewModel.meals : mealsViewModel.meals.filter({$0.strMeal?.contains(search) ?? false}), id: \.idMeal) {(meal) in
                            NavigationLink(destination: MealDetailView(mealDetailViewModel: MealDetailViewModel(meal: meal))) {
                                HStack {
                                    MealIconView(url: URL(string: meal.strMealThumb ?? ""))
                                    Text(meal.strMeal ?? "")
                                }
                            }
                            
                        }
                    }
                }
                .searchable(text: $search)
                .toolbar(content: {
                    ToolbarItem {
                        Button {
                            info = true
                        } label: {
                            Image(systemName: "info.circle")
                        }
                        
                    }
                })
                if mealsViewModel.loading {
                    ProgressView()
                }
            }
            .sheet(isPresented: $info, content: {
                MealInfo(mealsViewModel: mealsViewModel)
            })
            .navigationBarTitleDisplayMode(.inline)
            .task {
                do {
                    try await self.mealsViewModel.loadMeals()
                } catch {
                    errorMessage = error.localizedDescription
                    alertError = true
                }
              
            }
        }
    }
}



