//
//  MealDetailHeaderView.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI

struct MealDetailHeaderView: View {
    @ObservedObject var mealsViewModel: MealDetailViewModel
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: mealsViewModel.meal.strMealThumb ?? ""))
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            VStack(alignment: .leading) {
                Text(mealsViewModel.meal.strMeal ?? "Meal")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                if let category = mealsViewModel.mealDetail?.strCategory {
                    Text(category)
                        .foregroundColor(.white)
                        .bold()
                        .padding(6)
                        .background(RoundedRectangle(cornerRadius: 40).fill(Color.primary))
                }
            }
            Spacer()
        }
    }
}

