//
//  TCACounterApp.swift
//  TCACounter
//
//  Created by Nitin George on 27/01/2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCACounterApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(store: Store(initialState: CounterFeature.State()) {
                CounterFeature()
            })
        }
    }
}
