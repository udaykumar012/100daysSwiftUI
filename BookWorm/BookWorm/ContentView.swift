//
//  ContentView.swift
//  BookWorm
//
//  Created by Uday Kumar Kotla on 08/07/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students : FetchedResults<Student>
    var body: some View {
        VStack {
            Text("Students").font(.title).bold()
            List(students ,id: \.id){
                stu in
                Text(stu.name ?? "Unknown")
            }
            Button("ADD"){
                let firstNames = ["Uday","Jp","Mrunal"]
                let lastnames = ["Thakur", "Kotla"]
                let rand_fst = firstNames.randomElement()!
                let rand_lst = lastnames.randomElement()!
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
