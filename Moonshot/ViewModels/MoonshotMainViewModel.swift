//
//  MoonshotMainViewModel.swift
//  Moonshot
//
//  Created by murad on 16.06.2026.
//

import Foundation

@Observable
final class MoonshotMainViewModel {
    private(set) var astronauts: [String: Astronaut] = [:]
    private(set) var missions: [Mission] = []
    
    init() {
        loadData()
    }
    
    private func loadData() {
        astronauts = Bundle.main.decode("astronauts.json")
        missions = Bundle.main.decode("missions.json")
    }
}
