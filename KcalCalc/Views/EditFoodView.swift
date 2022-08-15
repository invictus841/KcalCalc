//
//  EditFoodView.swift
//  KcalCalc
//
//  Created by Alexandre Talatinian on 15/08/2022.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("\(food.name!)", text: $name)
                    .onAppear {
                        name = food.name!
                        calories = food.calories
                    }
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1500, step: 30)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Modify") {
                        DataController().editFood(food: food, name: name, calories: calories, context: moc)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}


