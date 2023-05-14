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
            CellView(step: "\(mealDetail.strMeasure1 ?? "") \(mealDetail.strIngredient1 ?? "")")
            CellView(step: "\(mealDetail.strMeasure2 ?? "") \(mealDetail.strIngredient2 ?? "")")
            CellView(step: "\(mealDetail.strMeasure3 ?? "") \(mealDetail.strIngredient3 ?? "" ) ")

        }.padding([.leading])
    }
}

