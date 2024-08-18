//
//  EasiCashApp.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI
import TipKit

@main
struct EasiCashApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        try Tips.configure([
                            .displayFrequency(.immediate),
                            .datastoreLocation(.applicationDefault)
                        ])
                    }
                    catch {
                        print("Error initializing TipKit \(error.localizedDescription)")
                    }
                }
        }
    }
}
