//
//  MealSourceView.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI

struct MealSourceView: View {
    var mealDetail: MealDetail
    var body: some View {
        VStack(alignment: .leading) {
            if let src = mealDetail.strSource, let url = URL(string: src) {
                HStack(alignment: .center, spacing: 15) {
                    Text("Source")
                        .bold()
                        .underline()
                    Link(destination: url) {
                        Text(src)
                    }.foregroundColor(.primary)
                }.padding()
            }
        }
    }
}


