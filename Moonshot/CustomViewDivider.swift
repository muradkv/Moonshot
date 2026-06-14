//
//  CustomViewDivider.swift
//  Moonshot
//
//  Created by murad on 14.06.2026.
//

import SwiftUI

struct CustomViewDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomViewDivider()
}
