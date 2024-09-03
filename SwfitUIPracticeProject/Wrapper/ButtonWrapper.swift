//
//  ButtonWrapper.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/2/24.
//

import Foundation
import SwiftUI


private struct ButtonWrapper: ViewModifier {
    
    let action: () -> Void

    func body(content: Content) -> some View {
        Button(action: action,
               label: {content})
    }
}

extension View {
    func wrapToButton(action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(action: action))
    }
}
