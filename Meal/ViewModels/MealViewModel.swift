//
//  DataLoader.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import Foundation

import SwiftUI

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var loading = false // shows progress view while loading
    var category: Category? // Load menu for this category
    
    /// Initialise viewmodel for selected category
    /// - Parameter category: Category of Meal
    init(category: Category? = nil) {
        self.category = category
    }
    /// Asynchronously load meals of given category
     func loadMeals() async throws {
         await MainActor.run {
             loading = true
         }
        guard let url = URL(string: URLS.mealMenuENdpoint+(category?.strCategory ?? "")) else {
             throw MealError.invalidUrl
         }
        let urlSession = URLSession.shared
        
            let (data, response) = try await urlSession.data(from: url)
            print(response)
         guard (response as? HTTPURLResponse)?.statusCode == 200 else {
             throw MealError.notFound
         }
         try await MainActor.run {
             let mealsResponse: Meals = try JSONDecoder().decode(Meals.self, from: data)
             
             self.meals = mealsResponse.meals ?? []
             self.meals = self.meals.compactMap({$0})

             // Filter nil values and sort by name
             self.meals = self.meals.filter({$0.strMeal != nil})
             self.meals.sort { a, b in
                 a.strMeal ?? "" < b.strMeal ?? ""
             }
             loading = false
         }
    }
}
//func downloadImage(url: URL, completionHandler: @escaping (UIImage?, Error?) -> Void) {
//    // Download the image asynchronously.
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        // Check for errors.
//        guard let data = data, error == nil else {
//            completionHandler(nil, error)
//            return
//        }
//
//        // Create an image from the data.
//        let image = UIImage(data: data)
//
//        // Call the completion handler with the image.
//        completionHandler(image, nil)
//    }.resume()
//}
