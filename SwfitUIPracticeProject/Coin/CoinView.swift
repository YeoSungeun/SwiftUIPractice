//
//  CoinView.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/3/24.
//

import SwiftUI

struct CoinView: View {
    @State var searchText = ""
    @State var markets: Markets = []
    @State var market = Market(market: "마켓", koreanName: "코리안", englishName: "잉글리시")
    var filterList: Markets {
        if searchText.isEmpty {
            return markets
        } else {
            return markets.filter { $0.koreanName.localizedStandardContains(searchText)}
        }
    }
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView(market: $market)
                listView()
            }
            .navigationTitle("My Coin")
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer,
                        prompt: "마켓을 검색해보세요.")
            .task {
                do {
                    let result = try await UpbitAPI.fetchMarketAsync()
                    markets = result
                    market = result.shuffled()[0]
                } catch {
                    
                }
            }
            .refreshable {
                market = markets.shuffled()[0]
            }
        }
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach($markets, id: \.id) { $item in
                NavigationLink {
//                    CoinDetailView(market: $item.wrappedValue)
                    CoinRowView(item: $item)
                } label: {
//                    rowView(item)
//                    CoinRowView(item: $item)
//                    LazyNavigationView {
//                        CoinRowView(item: $item)
//                    }
                    LazyNavigationView(CoinRowView(item: $item))
                    
                }
            }
            .foregroundStyle(.black)
        }
    }

}

#Preview {
    CoinView()
}

struct bannerView: View {
    @Binding var market: Market
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.green)
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .scaleEffect(2.5)
                        .offset(x: 0, y: 10)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(height: 150)
                .padding()
            VStack(alignment: .leading) {
                Spacer()
                Text(market.market)
                Text(market.koreanName)
                    .font(.title)
            }
            .foregroundStyle(.white)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(30)
        }
    }
}

struct CoinRowView: View {
    @Binding var item: Market
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.koreanName)
                    .font(.title3)
                    .bold()
                Text(item.englishName)
            }
            Spacer()
            Text(item.market)
            Button(action: {
                item.like.toggle()
            }, label: {
                Image(systemName: item.like ? "star.fill" : "star")
                    .foregroundStyle(.yellow)
            })
        }
        .padding()
    }
    
}
