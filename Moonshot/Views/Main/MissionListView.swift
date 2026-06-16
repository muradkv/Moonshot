//
//  MissionListView.swift
//  Moonshot
//
//  Created by murad on 15.06.2026.
//

import SwiftUI

struct MissionListView: View {
    let viewModel: MoonshotMainViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.missions) { mission in
                NavigationLink {
                    let missionVM = MissionViewModel(
                        mission: mission,
                        astronauts: viewModel.astronauts
                    )
                    
                    MissionView(viewModel: missionVM)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    }
                    
                }
                .listRowBackground(Color.darkBackground)
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        MissionListView(viewModel: MoonshotMainViewModel())
            .background(.darkBackground)
    }
}
