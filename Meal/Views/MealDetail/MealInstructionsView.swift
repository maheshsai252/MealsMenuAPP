//
//  MealInstructionsView.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI

struct MealInstructionsView: View {
    var mealDetail: MealDetail
    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.title3)
                .underline()
                .padding([.leading])
            VStack(alignment: .leading, spacing: 0) {
                if let instructions = mealDetail.strInstructions?.replacingOccurrences(of: "\r\n", with: "\n").split(separator: "\n"){
                    ForEach(0..<instructions.count, id: \.self) { strIdx in
                        CellView(step: String(instructions[strIdx])
                            .replaceDigitsFollowedByParentheses()
                            .removeLeadingSpaces()
                        )
                        if strIdx != instructions.count-1 {
                            Divider()
                                .frame(height: 1.5)
                                .background(Color.black)
                                .padding(0)
                        }
                    }
                }
            }.overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.primary, lineWidth: 2)
            ).padding([.leading,.trailing,.bottom])
        }
    }
}

