//
//  iTourApp.swift
//  iTour
//
//  Created by Sanjai Balajee on 12/02/24.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:Destination.self)
        
    }
}
