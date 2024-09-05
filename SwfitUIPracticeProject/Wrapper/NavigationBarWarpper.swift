//
//  NavigationBarWarpper.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/5/24.
//

import Foundation
import SwiftUI

private struct NavigationLinkWarpper<T: View>: ViewModifier {
    
    let destination: () -> T

    func body(content: Content) -> some View {
        NavigationLink(destination: destination, label: {content})
    }
}

extension View {
    func wrapToNavigationLink(destination: @escaping () -> some View) -> some View {
        modifier(NavigationLinkWarpper(destination: destination))
    }
}
