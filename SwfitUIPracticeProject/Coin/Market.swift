//
//  Market.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/3/24.
//

import Foundation

typealias Markets = [Market]

struct Market: Hashable, Codable, Identifiable {
    let id = UUID()
    let market, koreanName, englishName: String
    var like = false

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}
