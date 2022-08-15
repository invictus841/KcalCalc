//
//  KcalCalcApp.swift
//  KcalCalc
//
//  Created by Alexandre Talatinian on 15/08/2022.
//

import SwiftUI

@main
struct KcalCalcApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
