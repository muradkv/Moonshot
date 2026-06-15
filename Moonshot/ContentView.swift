//
//  ContentView.swift
//  Moonshot
//
//  Created by murad on 03.06.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var isGrid = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if isGrid {
                    MissionGridView(
                        astronauts: astronauts,
                        missions: missions
                    )
                } else {
                    MissionListView(
                        astronauts: astronauts,
                        missions: missions
                    )
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    isGrid.toggle()
                } label: {
                    Image(systemName: isGrid ? "list.dash" : "square.grid.2x2")
                        .accessibilityLabel(isGrid ? "Switch to list view" : "Switch to grid view")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
