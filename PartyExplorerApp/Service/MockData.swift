//
//  File.swift
//  PartyExplorerApp
//
//  Created by Sanjay Mali on 04/12/23.
//

import Foundation
class MockData{
    func getAllParties() async throws -> [PartyModel]{
        [
            PartyModel(id: 1112, name: "Berlin Concert", bannerImageURL: URL(string: "https://via.placeholder.com/600/f9cee5")!, price: 62.8, startDate: Date(), endDate: nil),
            PartyModel(id: 2212, name: "Bollywood Night", bannerImageURL:  URL(string: "https://via.placeholder.com/600/56acb2")!, price: 0.0, startDate: Date(), endDate: nil),
            PartyModel(id: 5533, name: "Techno Music", bannerImageURL:  URL(string: "https://via.placeholder.com/600/8985dc")!, price: 32.8, startDate: Date(), endDate: nil),
            PartyModel(id: 6655, name: "Retirement Party", bannerImageURL: URL(string: "https://via.placeholder.com/600/e924e6")!, price: 0.0, startDate: Date(), endDate: nil)
        ]
    }
}
