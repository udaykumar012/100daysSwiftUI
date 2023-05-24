//
//  NotesView.swift
//  sampleproj1
//
//  Created by Uday Kumar Kotla on 11/05/23.
//

import SwiftUI

struct NotesView: View {
    //@EnvironmentObject var ItemModel : ItemViewModel
    @ObservedObject var ItemModel : ItemViewModel
    @Binding var items : [String]
    var body: some View {
    
//        VStack{
//            Text("notes")
//            ScrollView{
//                ForEach(items,id:\.self){ it in
//                    Text(it).font(.largeTitle)
//                        .foregroundColor(.red)
//
//                }
//            }
            
        VStack{
            HStack{
                Spacer()
                Text("Notes").font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }.background(.blue.opacity(0.8))
            HStack{
//                ScrollView{
//                    //List or ForEach
//                    ForEach(ItemModel.itemList, id:\.self ){ it in
//                        HStack(alignment:.bottom){
//                            VStack(alignment:.leading){
//                                Text(">  "+it).font(.title3)
//
//                            }
//                            Spacer()
//                        }.padding(9)
//                            .background(.regularMaterial.opacity(0.7))
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                        .shadow( radius: 10)
//
//                    }
//                }
                
                List{
                    ForEach(ItemModel.itemList, id:\.self ){ it in
                    
                    Section{
                        HStack{
                            Text(it)
                            Spacer()
//                            Button("Remove"){
//                                if let index = ItemModel.itemList.firstIndex(of: it){
//                                    ItemModel.itemList.remove(at: index)
//                                }
//                            }
                        }
                        
                    }header: {
                        Text("Note")
                    }
                }
                    .onDelete { IndexSet in
                        ItemModel.itemList.remove(atOffsets: IndexSet)
                    }
                }
                
                
            }
            
        }.padding(10)
        
//        ButtonView(action: {
//            if(!items.isEmpty){
//                items.removeLast()
//            }
//            print(items)
//        }, btn: "Delete Last")
        
//        Button("Remove Last"){
//            if(!ItemModel.itemList.isEmpty){
//                ItemModel.removelast()
//                print(ItemModel.itemList)
//            }
//        }
        
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(ItemModel: ItemViewModel(),items: .constant(ItemViewModel().itemList))
            //.environmentObject(ItemViewModel())
    }
}
