//
//  love_careApp.swift
//  love&care
//
//  Created by Engy on 14/05/2023.
//

import SwiftUI

@main
struct love_careApp: App {
    @AppStorage("isBorading") var isBorading:Bool = true

    var body: some Scene {
        WindowGroup {
           ContentView()
        }
    }
}
