//
//  ImageDetailView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/6/24.
//

import SwiftUI

struct ImageDetailView: View {
    @Binding var sectionTitle: String
    var image: Image
    var body: some View {
        VStack {
            TextField(sectionTitle, text: $sectionTitle)
            image
                .resizable()
                .frame(width: 120, height: 180)
        }
    }
}

#Preview {
    ImageDetailView(sectionTitle: .constant("sectionTitle"), image: Image(systemName: "star"))
}
