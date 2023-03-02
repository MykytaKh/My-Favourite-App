//
//  SummaryTextModifier.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 02.03.2023.
//

import SwiftUI

struct SummaryTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.secondary)
    }
}
