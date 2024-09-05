//
//  RandomImageView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/5/24.
//

import SwiftUI

struct RandomImageView: View {
    
    @Binding var text: String
    
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/200/300")) { data in
            switch data {
            case .empty:
                ProgressView()
                    .scaledToFit()
                    .frame(width: 120, height: 180)
            case .success(let image):
                NavigationLink {
                    ImageDetailView(sectionTitle: $text, image: image)
                } label: {
                    image
                        .resizable()
                        .frame(width: 120, height: 180)
                }
            case .failure(let error):
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 120, height: 180)
            @unknown default:
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 120, height: 180)
            }
        }
    }
}
//
//#Preview {
//    RandomImageView(randomNumber: .constant(1))
//}

