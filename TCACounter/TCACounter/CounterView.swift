//
//  ContentView.swift
//  TCACounter
//
//  Created by Nitin George on 27/01/2025.
//

import SwiftUI
import ComposableArchitecture

struct CounterFeature: Reducer {
    
    struct State {
        var count: Int = 0
    }
    
    enum Action {
        case decrement
        case increment
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .decrement:
            state.count -= 1
            return .none
        case .increment:
            state.count += 1
            return .none
        }
    }
}

struct CounterView: View {
    
    let store: StoreOf<CounterFeature>
    
    var body: some View {

        WithViewStore(self.store, observe: \.count) { viewStore in
            HStack(spacing: 30) {
                Button {
                    viewStore.send(.decrement)
                } label: {
                    Text("-")
                        .bold()
                }
                
                Text("\(viewStore.state)")
                
                Button {
                    viewStore.send(.increment)
                } label: {
                    Text("+")
                        .bold()
                }
            }
        }
    }
}

#Preview {
    CounterView(store: Store(initialState: CounterFeature.State()) {
        CounterFeature()
    }
     )
}
