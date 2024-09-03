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
    var isSelected: Bool
}

struct ProfileImageSelectedView: View {
    
    @Binding var list: [ProfileImage]
    
    struct ProfileImage {
        let id = UUID()
        let name: String
        var isSelected: Bool
    }
    
    var body: some View {
        VStack {
            Text()
            Button("zmffla") {
                profilename = "바뀸!"
            }
        }
        .navigationTitle("PROFILE SETTING")
    }
}

#Preview {
    ProfileImageSelectedView(profilename: .constant(""))
}

struct ProfileImageGridView: View {

    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
