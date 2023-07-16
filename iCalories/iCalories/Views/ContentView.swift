//
//  ContentView.swift
//  iCalories
//
//  Created by Uday Kumar Kotla on 14/07/23.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date,order:.reverse)]) var food: FetchedResults<Food>
//@FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Food.date, ascending: false)]) var food: FetchedResults<Food>
    @State private var showAddView = false
    
    
    private func totalCaloriesToday()->Double{
        var caloriesToday: Double = 0
        for item in food {
            if Calendar.current.isDateInToday(item.date!) {
                caloriesToday += item.calories
            }
        }
        return caloriesToday
    }
    
    private func deleteFood(offsets:IndexSet){
        withAnimation {
            offsets.map { food[$0] }.forEach (moc.delete)
            DataController().save (context: moc)
        }
    }
    var body: some View {
        VStack {
            
            NavigationStack{
                VStack(alignment: .leading) {
                    Text("\(Int(totalCaloriesToday())) kcal (Today)")
                        .foregroundColor(.gray)
                    
                    List{
                        ForEach(food){
                            fd in
                            NavigationLink(destination: EditFoodView(food: fd)) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text (fd.name!)
                                            .bold ()
                                        Text ("\(Int (fd.calories))") +
                                        Text ("calories") .foregroundColor (.red)
                                    }
                                    Spacer ( )
                                    Text (calcTimeSince (date: fd.date!))
                                        .foregroundColor(.gray)
                                        .italic()
                                }
                            
                            }
                        }
                        .onDelete(perform: deleteFood)
                    }
                    .listStyle(.plain)
                }.navigationTitle("ICalories")
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button{
                                showAddView.toggle()
                            }label: {
                                Image(systemName: "plus.circle")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                    }
                    .sheet(isPresented: $showAddView, content: {
                        AddFoodView()
                    })
                    .padding(.horizontal)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
