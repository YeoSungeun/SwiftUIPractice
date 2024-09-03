//
//  ProfileSettingView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State var profilename: String = "profile_0"
    @State var list: [ProfileImage] = []
    
    
    var body: some View {
        VStack {
            NavigationLink {
                ProfileImageSelectedView(list: $list)
            } label: {
                Image(profilename)
                    .asSelectedImage()
                    
                    
                    
            }
            
        }
        .navigationTitle("PROFILE SETTING")
    }
}

#Preview {
    ProfileSettingView()
}
