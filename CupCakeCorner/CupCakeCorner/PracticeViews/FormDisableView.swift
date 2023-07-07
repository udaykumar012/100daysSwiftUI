//
//  FormDisableView.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 06/07/23.
//

import SwiftUI

struct FormDisableView: View {
    @State private var username:String = ""
    @State private var email:String = ""
    var body: some View {
        Form{
            Section{
                TextField("username",text: $username)
                TextField("email", text: $email)
            }
            Section{
                Button("Create account"){
                    print("Creating account..")
                }
            }.disabled(disabledButton())
            Text("btn disabled : \(disableBtn.description)")
        }
        
    }
    //we can use computed property or func
    var disableBtn :Bool{
        username.count<5 || email.count<5
    }
    func disabledButton() -> Bool{
        if(username.count<5 || email.count<5){
            return true
        }
        return false
    }
}

struct FormDisableView_Previews: PreviewProvider {
    static var previews: some View {
        FormDisableView()
    }
}
