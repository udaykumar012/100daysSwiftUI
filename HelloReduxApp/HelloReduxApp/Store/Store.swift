//
//  Store.swift
//  HelloReduxApp
//
//  Created by Uday Kumar Kotla on 03/06/23.
//

//global store file
import Foundation

//global state file

struct State{
    //contains global states
    var counter : Int = 0
}
protocol Action { }
struct IncrementAction :Action {
    
}
struct DecrementAction :Action {
    
}
struct Add100Action :Action {
    
}
struct NoAction:Action{}

//Reducer - which is a function that takes (state and action) and return new state
typealias Reducer = (_ state : State,_ action: Action) -> State
func reducer(_ state : State,_ action: Action ) -> State{
    var state = state
    switch(action){
    case _ as IncrementAction :
        state.counter += 1
    case _ as DecrementAction :
        state.counter -= 1
    case _ as Add100Action :
        state.counter += 100
    default :
        break
    }
    return state
}


//Our Redux store
class Store :  ObservableObject{
    //it require reducer and state
    // reducer -  responsible for updating a state
    var reducer : Reducer
    @Published var state : State
    
    init(reducer: @escaping Reducer = reducer(_:_:), state : State = State()){
        self.reducer = reducer
        self.state = state
    }
    func dispatch(action:Action){
        state = reducer(state,action)
    }
    
}
