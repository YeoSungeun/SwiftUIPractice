//
//  ProfileSettingView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State var profilename: String = "profile_0"
    
    var body: some View {
        VStack {
            NavigationLink {
                ProfileImageSelectedView(profilename: profilename)
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
