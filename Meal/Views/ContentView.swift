//
//  ContentView.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var showSplash = true
    var body: some View {
        ZStack {
            NavigationStack {
                CategoriesView()
            }
            if showSplash == true {
                SplashView()
            }
        }.onAppear() {
            stop()
        }
        
    }

    func stop() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.3) {
            withAnimation(.easeInOut) {
                    self.showSplash = false
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
