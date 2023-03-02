//
//  TitleTextModifier.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 02.03.2023.
//

import SwiftUI

struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.Text.title)
    }
}
