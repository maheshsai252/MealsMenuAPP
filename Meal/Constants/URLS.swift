//
//  URLS.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import Foundation

struct URLS {
    // URL Endpoint to fetch categories
    static var categoryURLEndpoint = "https://www.themealdb.com/api/json/v1/1/categories.php"
    // URL Endpoint to fetch meal detail
    static var mealDetailEndpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    // URL Endpoint to fetch meals inside category
    static var mealMenuENdpoint = "https://themealdb.com/api/json/v1/1/filter.php?c="
}
