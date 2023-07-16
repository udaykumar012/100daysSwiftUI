//
//  NotesArrayView.swift
//  BookWorm
//
//  Created by Uday Kumar Kotla on 08/07/23.
//

import SwiftUI

struct NotesArrayView: View {
    @Binding var mynotes : [String]
    var body: some View{
        VStack{
            List(mynotes,id: \.self){nts in
                Text(nts)
            }
            .navigationTitle("Saved notes")
        }
    }
}

struct NotesArrayView_Previews: PreviewProvider {
    static var previews: some View {
        NotesArrayView(mynotes: .constant(["abc"]))
    }
}
