//
//  MealDetailViewModel.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import Foundation
import SwiftUI

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?
    @Published var loading = false // shows progress view while loading
    var meal: Meal // Meal for which details to be fetched
    
    init(mealDetail: MealDetail? = nil, meal: Meal) {
        self.mealDetail = mealDetail
        self.meal = meal
    }
    
    /// Load Detail of selected Meal
    func loadMeals() async throws {
         await MainActor.run {
            loading = true
        }
        guard let idmeal = meal.idMeal else {
            throw MealError.notFound
        }
        guard let url = URL(string: "\(URLS.mealDetailEndpoint)\(idmeal)") else {
            throw MealError.invalidUrl
        }
        let urlSession = URLSession.shared
        let (data, response) = try await urlSession.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw MealError.notFound
        }
        try await MainActor.run {
            let mealsResponse: MealDetailResponse = try JSONDecoder().decode(MealDetailResponse.self, from: data)
            self.mealDetail = mealsResponse.meals?.first
            loading = false
        }
       
    }
}
