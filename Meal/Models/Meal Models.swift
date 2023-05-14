//
//  Models.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import Foundation

struct Meals: Codable {
    var meals: [Meal]?
    
}
struct Meal: Codable {
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
}

struct MealDetail: Codable {
    var strCategory: String?
    var strInstructions: String?
    var strMealThumb: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeal: String?
    var idMeal: String?
    var strSource: String?
    var strTags: String?
    var strDrinkAlternate: String?
}
struct MealDetailResponse: Codable {
    var meals: [MealDetail]?
}

