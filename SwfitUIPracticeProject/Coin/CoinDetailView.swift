//
//  CoinDetailView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/3/24.
//

import Foundation
import SwiftUI

struct CoinDetailView: View {
    var market: Market
    
    var body: some View {
        Text(market.koreanName)
    }
}
