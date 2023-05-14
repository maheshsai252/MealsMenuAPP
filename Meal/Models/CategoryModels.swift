//
//  CategoryModels.swift
//  Meal
//
//  Created by Mahesh sai on 5/14/23.
//

import Foundation

struct Category: Codable {
    var idCategory: String?
    var strCategory: String?
    var strCategoryThumb: String?
    var strCategoryDescription: String?
}
struct CategoryResponse: Codable {
    var categories: [Category]?
}
