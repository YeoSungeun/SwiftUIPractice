//
//  ProfileImagSelectedView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/2/24.
//

import SwiftUI

struct ProfileImage {
    let id = UUID()
    let name: String
    let index: Int
    var isSelected: Bool
}

struct ProfileImageSelectedView: View {
    
    @Binding var list: [ProfileImage]
    
    var body: some View {
        VStack {
            Text("")
            Button("zmffla") {
               
            }
        }
        .navigationTitle("PROFILE SETTING")
    }
}
//
//#Preview {
//    ProfileImageSelectedView(list: )
//}

struct ProfileImageGridView: View {

    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
