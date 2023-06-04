//
//  ContentView.swift
//  HelloReduxApp
//
//  Created by Uday Kumar Kotla on 03/06/23.
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var store : Store
    //creating custom variable for counter
    struct props{
        let counter : Int
         
    }
    private  func map(state:State)->props{
        return props(counter: state.counter)
    }
    private func actionDispatcher(action:Action = NoAction()){
        store.dispatch(action: action)
    }
    var body: some View {
        let prop = map(state: store.state)
        return VStack {
            Text("\(prop.counter)")
            Button("Inc"){
                actionDispatcher(action:IncrementAction())
            }
            Button("Dec"){
                actionDispatcher(action:DecrementAction())
            }
            Button("Add 100"){
                actionDispatcher(action:Add100Action())
            }
            Button("No action"){
                actionDispatcher(action: NoAction())
            }
            NavigationView {
                NavigationLink {
                    TempView()
                } label: {
                    Text("our state counter")
                }
            }
            

            
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Store())
    }
}
