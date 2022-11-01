//
//  TelegramContestApp.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 29.10.2022.
//
//
import SwiftUI

@main
struct AppController: App {
    @EnvironmentObject var model: ViewModel
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(ColorScheme.dark)
        }
    }
}
