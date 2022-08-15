//
//  SplashScreenView.swift
//  KcalCalc
//
//  Created by Alexandre Talatinian on 15/08/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @StateObject private var dataController = DataController()
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        } else {
            VStack {
                VStack {
                    Image("balance")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .font(.system(size: 80))
                    Text("Calories Calculator")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(.black.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
        
        

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
