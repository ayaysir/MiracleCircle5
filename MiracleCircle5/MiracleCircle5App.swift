//
//  MiracleCircle5App.swift
//  MiracleCircle5
//
//  Created by 윤범태 on 3/28/24.
//

import SwiftUI

@main
struct MiracleCircle5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            // CorDataContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            DragActionView()
        }
    }
}
