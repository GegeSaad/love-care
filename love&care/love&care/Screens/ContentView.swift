//
//  ContentView.swift
//  love&care
//
//  Created by Engy on 14/05/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isBorading") var isBorading:Bool = true

    var body: some View {
        if isBorading{
            OnBoarding()
        }else{
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
