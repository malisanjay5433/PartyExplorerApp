//
//  PartyModel.swift
//  PartyExplorerApp
//
//  Created by Sanjay Mali on 04/12/23.
//

import Foundation
struct PartyModel: Codable,Identifiable {
    var id = UUID()
    let name: String
    let bannerImageURL: URL
    let price: Double
    let startDate:Date
    let endDate: Date?
}
