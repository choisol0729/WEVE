//
//  WEVEApp.swift
//  WEVE
//
//  Created by Sol Choi on 2022/04/22.
//

import SwiftUI

@main
struct WEVEApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

