//
//  TempView.swift
//  HelloReduxApp
//
//  Created by Uday Kumar Kotla on 04/06/23.
//

import SwiftUI

struct TempView: View {
    @EnvironmentObject var store: Store
    var body: some View {
        Text("\(store.state.counter)")
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView().environmentObject(Store())
    }
}
