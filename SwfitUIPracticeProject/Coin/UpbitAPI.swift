//
//  UpbitAPI.swift
//  SwfitUIPracticeProject
//
//  Created by 여성은 on 9/3/24.
//
import Foundation

struct UpbitAPI {
    
    private init() { }

    static func fetchAllMarket(completion: @escaping ([Market]) -> Void) {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)
                DispatchQueue.main.async { // uiupdate를 위해서 main으로 보냄
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume() // dataTask을 시작하게
        
        
    }
    
    static func fetchMarketAsync() async throws -> Markets {
            let url = URL(string: "https://api.upbit.com/v1/market/all")!
            // 응답이 올때까지 기다리고 있을 것 !!!!!! -> 비동기이지만 동기처럼 action.
            let (data, response) = try await URLSession.shared.data(from: url)
            let decodeData = try JSONDecoder().decode(Markets.self, from: data)
            return decodeData
        }
        
        
    
}
