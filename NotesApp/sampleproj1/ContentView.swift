//
//  ContentView.swift
//  sampleproj1
//
//  Created by Uday Kumar Kotla on 11/05/23.
//

import SwiftUI

struct ContentView: View {
    //@StateObject var itemModel = AddItemViewModel()
    @StateObject var ItemModel = ItemViewModel()
    @State var addItem = false
    @State var items : [String] = []
    //@State var list : [String] = []
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            Text("TO DO LIST APP").font(.largeTitle)
            HStack{
                Spacer()

                Button{
                    addItem = !addItem
                    items = ItemModel.itemList
                
                }label: {
                    Image(systemName: !addItem ? "plus.rectangle.fill"  : "list.clipboard.fill")
                        .font(.title2)
                }
               
            }
            if(addItem){
                AddItemView(item: "",items: [],ItemModel: ItemModel)
            }
            else{
                NotesView(ItemModel: ItemModel , items: $ItemModel.itemList)
                   // .environmentObject(ItemModel)
                
            }
            
//     NavigationView{
//         NavigationLink("viewNotes", destination:NotesView(items : []))           }
            Spacer()
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
