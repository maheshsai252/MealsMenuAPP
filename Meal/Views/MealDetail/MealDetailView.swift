//
//  MealDetailView.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject var mealDetailViewModel: MealDetailViewModel
    @State var errorMessage = ""
    @State var alertError = false // alert user with error
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack{
                    if let mealDetail = mealDetailViewModel.mealDetail {
                        MealDetailHeaderView(mealsViewModel: mealDetailViewModel)
                        VStack(alignment: .leading) {
                            MealInstructionsView(mealDetail: mealDetail)
                            MealIngredientsView(mealDetail: mealDetail)
                            MealSourceView(mealDetail: mealDetail)
                        }
                        
                    }
                }
                if mealDetailViewModel.loading {
                    ProgressView()
                }
            }
        }.task {
            do {
                try await mealDetailViewModel.loadMeals()
            } catch {
                errorMessage = error.localizedDescription
                alertError = true
            }
        }
    }
}

struct CellView: View {
    @State var image = "rectangle"
    var step: String = ""
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    image = image == "rectangle" ? "checkmark.rectangle" : "rectangle"
                }
            VStack(alignment: .leading) {
                Text(step)
                
            }
            
        }.padding()
        
    }
}
