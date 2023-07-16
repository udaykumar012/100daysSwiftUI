//
//  TextEditorView.swift
//  BookWorm
//
//  Created by Uday Kumar Kotla on 08/07/23.
//

import SwiftUI


struct TextEditorView: View {
   @State var notes : String = ""
    @State var mynotes : [String] = []
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    TextEditor(text: $notes)
                    
                    Button("Save"){
                        mynotes.append(notes)
                        notes = ""
                    }
                    NavigationLink {
                        
                        NotesArrayView(mynotes: $mynotes)
                    } label: {
                        Text("View saved Notes")
                    }
                }
                .navigationTitle("Notes")
            }
            

        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
        
    }
}
