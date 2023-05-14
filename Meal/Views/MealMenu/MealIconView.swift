//
//  MealIconView.swift
//  Meal
//
//  Created by Mahesh sai on 5/14/23.
//

import SwiftUI

struct MealIconView: View {
    let url: URL?

    var body: some View {
        AsyncImage(
            url: url,
            transaction: Transaction(animation: .easeOut)
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .transition(.scale(scale: 0.1, anchor: .center))
            case .failure:
                Image(systemName: "wifi.slash")
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 44, height: 44).background(.ultraThinMaterial)
        .clipShape(Circle())
    }
}
