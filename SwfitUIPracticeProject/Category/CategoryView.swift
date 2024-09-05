//
//  CategoryView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/6/24.
//

import SwiftUI

struct CategoryView: View {
    @State var text = ""
    
    let item = ["SF", "스릴러", "로맨스", "코미디"]
    
    @State var categoryList: [Category] = []
    
    var filterList: [Category] {
        return text.isEmpty ? categoryList : categoryList.filter { $0.name.contains(text)}
    }
    
    var body: some View {
        NavigationView {
            List(filterList, id: \.id) { item in
                NavigationLink {
                    Text("\(item.name) (\(item.count))")
                } label: {
                    HStack {
                        Image(systemName: "person")
                        Text("\(item.name) (\(item.count))")
                    }
                }

               
            }
            .navigationTitle("영화 검색")
            .searchable(text: $text, 
                        placement: .navigationBarDrawer(displayMode: .automatic),
                        prompt: "장르를 검색해보세요")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus")
                        .wrapToButton {
                            categoryList.append(Category(name: item.randomElement()!, count: Int.random(in: 1...100)))
                        }
                }
            }
        }
    }
}

#Preview {
    CategoryView()
}
