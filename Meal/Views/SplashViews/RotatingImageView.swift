//
//  RotatingImageView.swift
//  Meal
//
//  Created by Mahesh sai on 5/14/23.
//

import SwiftUI

struct RotatingImage: View {
    @State var angle: Double = 0.0
        @State var isAnimating = false
        
        var foreverAnimation: Animation {
            Animation.linear(duration: 3.0)
                .repeatForever(autoreverses: false)
        }
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: 35, height: 35)
                       .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0))
                       .onAppear {
                           withAnimation(foreverAnimation) {
                               self.isAnimating = true

                           }
                   }
    }
}
