//
//  RadiusBackground.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/2/24.
//

import Foundation
import SwiftUI

struct RadiusBackground: ViewModifier {
    
    let foregroundColor: Color
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 300, height: 44, alignment: .center)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 22))
            .multilineTextAlignment(.center)
    }
}

extension View {
    func asRadiusBackground(foregroundColor: Color, backgroundColor: Color) -> some View {
        modifier(RadiusBackground(foregroundColor: foregroundColor, backgroundColor: backgroundColor))
    }
}
