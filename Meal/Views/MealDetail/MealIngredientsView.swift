//
//  MealIngredientsView.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI

struct MealIngredientsView: View {
    var mealDetail: MealDetail
    var body: some View {
        Text("Ingredients")
            .font(.title3)
            .underline()
            .padding(.leading)
            
        VStack(alignment: .leading) {
            if let ingredient1 = mealDetail.strIngredient1, !ingredient1.isEmpty {
                CellView(step: "\(mealDetail.strMeasure1 ?? "") \(ingredient1)")
            }
            if let ingredient2 = mealDetail.strIngredient2, !ingredient2.isEmpty  {
                CellView(step: "\(mealDetail.strMeasure2 ?? "") \(ingredient2)")
            }
            if let ingredient3 = mealDetail.strIngredient3, !ingredient3.isEmpty  {
                CellView(step: "\(mealDetail.strMeasure3 ?? "") \(ingredient3) ")
            }
            if let ingredient4 = mealDetail.strIngredient4, !ingredient4.isEmpty  {
                CellView(step: "\(mealDetail.strMeasure4 ?? "") \(ingredient4) ")
            }
            if let ingredient5 = mealDetail.strIngredient5, !ingredient5.isEmpty  {
                CellView(step: "\(mealDetail.strMeasure5 ?? "") \(ingredient5) ")
            }
            if let ingredient6 = mealDetail.strIngredient6, !ingredient6.isEmpty  {
                CellView(step: "\(mealDetail.strMeasure6 ?? "") \(ingredient6) ")
            }
            if let ingredient7 = mealDetail.strIngredient7, !ingredient7.isEmpty  {
                CellView(step: "\(mealDetail.strMeasure7 ?? "") \(ingredient7) ")
            }
            if let ingredient8 = mealDetail.strIngredient8, !ingredient8.isEmpty  {
                CellView(step: "\(mealDetail.strMeasure8 ?? "") \(ingredient8) ")
            }
            if let ingredient9 = mealDetail.strIngredient9, !ingredient9.isEmpty  {
                CellView(step: "\(mealDetail.strMeasure9 ?? "") \(ingredient9) ")
            }
            if let ingredient10 = mealDetail.strIngredient10, !ingredient10.isEmpty  {
                CellView(step: "\(mealDetail.strMeasure10 ?? "") \(ingredient10) ")
            }

        }.padding([.leading])
    }
}

