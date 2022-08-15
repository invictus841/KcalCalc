//
//  ContentView.swift
//  KcalCalc
//
//  Created by Alexandre Talatinian on 15/08/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    // Retrieving data from database
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    
    @State private var isShowingAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(totalCaloriesToday())) Kcal (Today)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                List {
                    ForEach(food) { food in
                        NavigationLink(destination: EditFoodView(food: food)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(food.name!)
                                        .bold()
                                    
                                    Text("\(Int(food.calories))").foregroundColor(.indigo) + Text(" calories").foregroundColor(.red)
                                }
                                Spacer()
                                Text(calcTimeSince(date: food.date!))
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                .listStyle(.plain)
            }
            .navigationTitle("KcalCalc")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddView.toggle()
                    } label: {
                        Label("Add food", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $isShowingAddView) {
                AddFoodView()
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func deleteFood(offsets: IndexSet) {
        withAnimation {
            offsets.map { food[$0] }.forEach(moc.delete)
            
            DataController().save(context: moc)
        }
    }
    
   private func totalCaloriesToday() -> Double {
       var caloriesToday: Double = 0
       for item in food {
           if Calendar.current.isDateInToday(item.date!) {
               caloriesToday += item.calories
           }
       }

       return caloriesToday
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
