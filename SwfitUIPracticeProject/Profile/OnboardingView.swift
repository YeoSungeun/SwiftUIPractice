//
//  OnboardingView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/2/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("launch")
                    .padding(.bottom ,50)
                Image("launchImage")
                
                NavigationLink("시작하기") {
                    ProfileSettingView()
                }
                .asRadiusBackground(
                    foregroundColor: .white,
                    backgroundColor: .blue
                )
                .offset(y: 80)

            }
           
        }
        
    }
}

#Preview {
    OnboardingView()
}
