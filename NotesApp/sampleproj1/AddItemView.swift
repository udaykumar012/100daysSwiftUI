//
//  AddItemView.swift
//  sampleproj1
//
//  Created by Uday Kumar Kotla on 11/05/23.
//

import SwiftUI

struct AddItemView: View {
    @State var item : String
    @State var items : [String]
    @ObservedObject var ItemModel : ItemViewModel
    var body: some View {
        VStack{
            Form{
                TextField("Item Name", text: $item)
                    .autocorrectionDisabled()
                ButtonView(action: {
                    ItemModel.add(item)
                    items = ItemModel.itemList
                }, btn: "Add Notes")
            }
            
            Text("\(ItemModel.itemList.count)")
            //NotesView( items: $ItemModel.itemList)
            
        }
        
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(item: "",items: [],ItemModel: ItemViewModel())
    }
}
