//
//  SplashView.swift
//  Meal
//
//  Created by Mahesh sai on 5/14/23.
//

import SwiftUI


struct SplashView: View {
    @State var scale: CGFloat = 1
    @State var outerscale: CGFloat = 1

    var body: some View {
        ZStack {
            Color.oppositePrimary
            VStack(alignment: .center, spacing: 35) {
                HStack(alignment: .center, spacing: 40){
                    RotatingImage(imageName: "birthday.cake")
                    RotatingImage(imageName: "carrot")
                }
                HStack(alignment: .center, spacing: 20){
                    RotatingImage(imageName: "cup.and.saucer.fill")
                    if outerscale == 1 {
                        Text("Meal")
                            .font(.title)
                            .padding()
                            .scaleEffect(scale)
                        
                    }
                    RotatingImage(imageName: "fork.knife")
                    
                }
                
                HStack(alignment: .center, spacing: 40){
                    RotatingImage(imageName: "wineglass.fill")
                    RotatingImage(imageName: "takeoutbag.and.cup.and.straw")
                    
                }
            }
            .padding()
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(.black, lineWidth: 4)
            )
        }.ignoresSafeArea()
            .scaleEffect(outerscale)
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        scale = 1.5
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        outerscale = 9

                    }
                }
            }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
