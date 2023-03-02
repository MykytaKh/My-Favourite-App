//
//  BorderButtonStyle.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 19.02.2023.
//

import SwiftUI

struct BorderButtonStyle: ButtonStyle {
    
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(lineWidth: 2)
                    .foregroundColor(color)
            )
    }
}
