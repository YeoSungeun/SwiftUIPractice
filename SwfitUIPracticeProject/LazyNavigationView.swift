//
//  LazyNavigationView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/5/24.
//

import SwiftUI

struct LazyNavigationView<Content: View>: View {
    
    let build: () -> Content
    
    var body: some View {
        build()
    }
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
        print("Lazy Navigation View Init")
    }
}
