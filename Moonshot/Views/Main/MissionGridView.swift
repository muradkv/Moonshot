//
//  MissionGridView.swift
//  Moonshot
//
//  Created by murad on 15.06.2026.
//

import SwiftUI

struct MissionGridView: View {
    let viewModel: MoonshotMainViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.missions) { mission in
                    NavigationLink {
                        MissionView(
                            mission: mission,
                            astronauts: viewModel.astronauts
                        )
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
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    MissionGridView(viewModel: MoonshotMainViewModel())
        .background(.darkBackground)
}
