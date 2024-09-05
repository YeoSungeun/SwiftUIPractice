//
//  MediaView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/6/24.
//

import SwiftUI
struct SectionTitle {
    let id = UUID()
    var title: String
}

struct MediaView: View {
    @State var textList = [ SectionTitle(title: "이 달의 추천 영화"),
                            SectionTitle(title: "다음 달 개봉 영화"),
                            SectionTitle(title: "다시 보기 드라마")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($textList, id: \.id) { item in
                    makeSection(item.title)
                }
            }
            .navigationTitle("Media")
        }
    }
    func makeSection(_ title: Binding<String>) -> some View {
        VStack {
            Text(title.wrappedValue)
                .font(.title2)
                .bold()
                .padding(.top, 10)
                .padding(.leading, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
            HorizontalSectionView(text: title)
        }
    }

}

#Preview {
    MediaView()
}
