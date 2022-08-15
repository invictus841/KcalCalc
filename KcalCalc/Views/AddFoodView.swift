//
//  AddFoodView.swift
//  KcalCalc
//
//  Created by Alexandre Talatinian on 15/08/2022.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("Food name", text: $name)
                
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1500, step: 30)
                }
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addFood(name: name, calories: calories, context: moc)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
