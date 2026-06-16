//
//  ContentView.swift
//  Moonshot
//
//  Created by murad on 03.06.2026.
//

import SwiftUI

struct MoonshotMainView: View {
    let viewModel: MoonshotMainViewModel
    @State private var isGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if isGrid {
                    MissionGridView(viewModel: viewModel)
                } else {
                    MissionListView(viewModel: viewModel)
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
            .navigationDestination(for: Mission.self) { mission in
                let detailViewModel = MissionViewModel(
                    mission: mission,
                    astronauts: viewModel.astronauts
                )
                MissionView(viewModel: detailViewModel)
            }
            .navigationDestination(for: Astronaut.self) { astronaut in
                AstronautView(astronaut: astronaut)
            }
        }
    }
}

#Preview {
    MoonshotMainView(viewModel: MoonshotMainViewModel())
}
