//
//  Colors.swift
//  TestApp
//
//  Created by Mykyta Khlamov on 19.02.2023.
//

import SwiftUI

extension Color {
    
    struct Text {
        static var title: Color {
            return Color("TitleTextColor")
        }
    }
    
    struct Button {
        static var favourite: Color {
            return Color("OnlyFavouriteButtonColor")
        }
        
        static var load: Color {
            return Color("LoadButtonColor")
        }
    }
    
}
