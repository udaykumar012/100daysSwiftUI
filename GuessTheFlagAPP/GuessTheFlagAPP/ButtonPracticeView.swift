//
//  ButtonPracticeView.swift
//  GuessTheFlagAPP
//
//  Created by Uday Kumar Kotla on 24/05/23.
//

import SwiftUI

struct ButtonPracticeView: View {
    @State var btnName : String = "No Button"
    @State var showAlert : Bool = false
    
    func getBtnName(_ str : String){
        self.btnName = str
    }
    func resetName(){
        btnName = "No Button"
    }
    var body: some View {
        VStack{
            Text("\(btnName) is clicked")
            //simple button
            Button("btn1" , role: .destructive){
                //action
                getBtnName("btn1")
            }
            Button("btn2 - reset",action: resetName) // action func type always ()->Void
            Group{
                Button("btn3"){  getBtnName("btn3") }
                    .buttonStyle(.bordered)
                Button("btn4",role: .destructive){
                    getBtnName("btn4")
                }
                .buttonStyle(.bordered)
                Button("btn5"){  getBtnName("btn5") }
                    .buttonStyle(.borderedProminent)
                Button("btn6",role: .destructive){  getBtnName("btn6") }
                    .buttonStyle(.borderedProminent)
                Button("btn7"){
                    getBtnName("btn7")
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
                
                //customizzedButton
                Button{
                    getBtnName("btn 8")
                }label: {
                    Text("Btn 8")
                        .padding(12)
                        .foregroundColor(.white)
                        .background(.orange,in:RoundedRectangle(cornerRadius: 20))
                }
                //add images to button
                //customizzedButton
                Button{
                    getBtnName("btn 9")
                }label: {
                    Label("Btn 9", systemImage: "9.circle")
                    //Text("Btn 9")
                        .padding(12)
                        .foregroundColor(.white)
                        .background(.orange,in:RoundedRectangle(cornerRadius: 20))
                }
            }
            Button(" click Alert"){
                showAlert = true
            }
            .alert("Warning - Alert!!!",isPresented: $showAlert){
                Button("Yes",role: .destructive){
                    getBtnName("alert")
                }
                Button("No",role: .cancel){}
            }message: {
                Text("R U SURE?")
                
            }
        }
        
    }
}

struct ButtonPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPracticeView()
    }
}
