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
    @State var nicknameText = ""
    @State var mbtiStatus = [[false, false], [false, false], [false, false], [false, false]]
    @State var isComplete = false
    @State var isFullPresent = false
    
    var body: some View {
        VStack {
            NavigationLink {
                ProfileImageSelectedView(list: $list)
            } label: {
                Image(profilename)
                    .asSelectedImage()
            }
            .padding(.top, 80)
            
            nicknameTextField(nicknameText: $nicknameText)
            
            mbtiGridView(mbtiStatus: $mbtiStatus, isComplete: $isComplete)
            
            Spacer()
            
            
            Button(action: {
                isFullPresent = true
            }, label: {
                Text("완료")
                    .asRadiusBackground(
                        foregroundColor: .white,
                        backgroundColor: isComplete ? .blue: .gray)
            })
            .disabled(isComplete)
        }
        .navigationTitle("PROFILE SETTING")
        .fullScreenCover(isPresented: $isFullPresent, content: {
            OkayView()
        })

    }
}
    struct nicknameTextField: View {
        @Binding var nicknameText: String
        var body: some View {
            TextField("닉네임을 입려해주세요 :)", text: $nicknameText)
                .padding()
            Divider()
                .padding(.horizontal, 20)
                .padding(.top, -10)
        }
    }
    struct mbtiGridView: View {
        @Binding var mbtiStatus: [[Bool]]
        @Binding var isComplete: Bool
        var body: some View {
            HStack(alignment: .top) {
                Text("MBTI")
                    .bold()
                LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: 12), count: 2), spacing: 15) {
                    ForEach(M.allCases, id: \.self) { item in
                        mbtiRow(mbtiStatus: $mbtiStatus,
                                isComplete: $isComplete,
                                itemString: item.string,
                                itemIndex: item.rawValue,
                                statusIndex: 0)
                    }
                    ForEach(B.allCases, id: \.self) { item in
                        mbtiRow(mbtiStatus: $mbtiStatus,
                                isComplete: $isComplete,
                                itemString: item.string,
                                itemIndex: item.rawValue,
                                statusIndex: 1)
                    }
                    ForEach(T.allCases, id: \.self) { item in
                        mbtiRow(mbtiStatus: $mbtiStatus,
                                isComplete: $isComplete,
                                itemString: item.string,
                                itemIndex: item.rawValue,
                                statusIndex: 2)
                    }
                    ForEach(I.allCases, id: \.self) { item in
                        mbtiRow(mbtiStatus: $mbtiStatus,
                                isComplete: $isComplete,
                                itemString: item.string,
                                itemIndex: item.rawValue,
                                statusIndex: 3)
                    }
                }
                .padding(.leading, 40)
                .frame(maxWidth: .infinity)
                
            }
            .padding()
        }
    }
    struct mbtiRow: View {
        
        @Binding var mbtiStatus: [[Bool]]
        @Binding var isComplete: Bool
        var itemString: String
        var itemIndex: Int
        var statusIndex: Int
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(mbtiStatus[statusIndex][itemIndex] ? .blue : .clear)
                    .stroke(mbtiStatus[statusIndex][itemIndex] ? .blue : .gray)
                Text("\(itemString)")
                    .bold()
            }
            .foregroundStyle(mbtiStatus[statusIndex][itemIndex] ? .white : .gray)
            .wrapToButton {
                mbtiStatus[statusIndex][itemIndex].toggle()
                if mbtiStatus[statusIndex][0] && mbtiStatus[statusIndex][1] {
                    if itemIndex == 0 {
                        mbtiStatus[statusIndex][1].toggle()
                    } else {
                        mbtiStatus[statusIndex][0].toggle()
                    }
                }
                isComplete = (mbtiStatus[0][0] || mbtiStatus[0][1]) && (mbtiStatus[1][0] || mbtiStatus[1][1]) && (mbtiStatus[2][0] || mbtiStatus[2][1]) && (mbtiStatus[3][0] || mbtiStatus[3][1])
                
                
            }
        }
    }
    
    
    #Preview {
        ProfileSettingView()
    }
    
    enum M: Int, CaseIterable {
        case E
        case I
        
        var string: String {
            switch self {
            case .E:
                "E"
            case .I:
                "I"
            }
        }
    }
    
    enum B: Int, CaseIterable {
        case S
        case N
        
        var string: String {
            switch self {
            case .S:
                "S"
            case .N:
                "N"
            }
        }
    }
    
    enum T: Int, CaseIterable {
        case T
        case F
        
        var string: String {
            switch self {
            case .T:
                "T"
            case .F:
                "F"
            }
        }
    }
    
    enum I: Int, CaseIterable {
        case J
        case P
        
        var string: String {
            switch self {
            case .J:
                "J"
            case .P:
                "P"
            }
        }
    }

