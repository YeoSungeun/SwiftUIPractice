//
//  HorizontalSectionView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/6/24.
//

import SwiftUI

struct HorizontalSectionView: View {
    @Binding var text: String
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { item in
                    RandomImageView(text: $text)
                }
            }
        }
    }
}

#Preview {
    HorizontalSectionView(text: .constant(""))
}
