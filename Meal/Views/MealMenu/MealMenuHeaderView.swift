//
//  MealMenuHeaderView.swift
//  Meal
//
//  Created by Mahesh sai on 5/14/23.
//

import SwiftUI

struct MealMenuHeaderView: View {
    @ObservedObject var mealsViewModel: MealViewModel
    var body: some View {
        Section {
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

        }
    }
}


