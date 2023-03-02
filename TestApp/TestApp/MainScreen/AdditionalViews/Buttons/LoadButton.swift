//
//  LoadButton.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 19.02.2023.
//

import SwiftUI

struct LoadButton: View {
    
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text("Load")
                .fontWeight(.semibold)
                .foregroundColor(.Button.load)
        }
        .buttonStyle(BorderButtonStyle(color: Color.Button.load))
    }
    
}
