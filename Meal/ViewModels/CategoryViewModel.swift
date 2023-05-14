//
//  CategoryViewModel.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import Foundation
import SwiftUI

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var loading = false // shows progress view while loading
    /// Load categories from the category endpoint
    func loadCategories() async throws {
         await MainActor.run {
            loading = true
        }
        guard let url = URL(string: URLS.categoryURLEndpoint) else {
            throw MealError.invalidUrl
        }
        let urlSession = URLSession.shared
        let (data, response) = try await urlSession.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw MealError.notFound
        }
        try await MainActor.run {
            let categoryResponse: CategoryResponse = try JSONDecoder().decode(CategoryResponse.self, from: data)
            self.categories = categoryResponse.categories ?? []
            self.categories = self.categories.compactMap({$0})
            loading = false
        }
    }
}
