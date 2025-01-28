//
//  BookwormApp.swift
//  Bookworm
//
//  Created by 千々岩真吾 on 2025/01/07.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Book.self)
        }
    }
}
