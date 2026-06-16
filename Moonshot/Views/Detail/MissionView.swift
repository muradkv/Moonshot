//
//  MissionView.swift
//  Moonshot
//
//  Created by murad on 11.06.2026.
//

import SwiftUI

struct MissionView: View {
    let viewModel: MissionViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Image(viewModel.mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                Text(viewModel.mission.formattedLaunchDate)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                CustomViewDivider()
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(viewModel.mission.description)
                    
                    CustomViewDivider()
                }
                .padding(.horizontal)
                
                CrewSectionView(crew: viewModel.crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(viewModel.mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let mainVM = MoonshotMainViewModel()
    let vm = MissionViewModel(mission: mainVM.missions[0], astronauts: mainVM.astronauts)
    
    return MissionView(viewModel: vm)
        .preferredColorScheme(.dark)
}
