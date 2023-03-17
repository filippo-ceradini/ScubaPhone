//
//  ScubaPhoneApp.swift
//  ScubaPhone
//
//  Created by Filippo on 16/03/23.
//

import SwiftUI
import CoreLocation



@main
struct ScubaPhoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
