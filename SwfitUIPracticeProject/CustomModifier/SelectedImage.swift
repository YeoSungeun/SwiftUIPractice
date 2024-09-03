//
//  SelectedImage.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/2/24.
//

import Foundation
import SwiftUI


extension Image {
    func asSelectedImage() -> some View {
        self
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue, lineWidth: 5))
            .overlay(
                   Image(systemName: "camera.fill")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 20, height: 20)
                       .background(Circle().fill(Color.blue))
                       .padding(7)
                       .clipShape(Circle())
                       .background(Circle().fill(Color.blue))
                       .foregroundColor(.white)
                       .offset(x: 0, y: 0),
                   alignment: .bottomTrailing  
               )
    }
}
