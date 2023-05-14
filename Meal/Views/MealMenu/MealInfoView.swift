//
//  MealInfoView.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI

struct MealInfo: View {
    @ObservedObject var mealsViewModel: MealViewModel
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: mealsViewModel.category?.strCategoryThumb ?? ""))
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(mealsViewModel.category?.strCategory ?? "")
                        .font(.largeTitle)
                        .italic()
                        .fixedSize(horizontal: false, vertical: true)
                        .underline()
                    
                }
                Spacer()
                
            }
            
            if let desc = mealsViewModel.category?.strCategoryDescription {
                Text(desc)
                    .bold()
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.black, lineWidth: 2)
                    )
                    .padding()
                
            }
        }
    }
}
