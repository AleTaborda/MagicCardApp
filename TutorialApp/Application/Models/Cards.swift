//
//  Cards.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 15/06/2021.
//

import UIKit

struct Card: Codable {
    let name: String
    let type: String
    let rarity: String
    let manaCost: String
    let text: String
    let power: String?
    let toughness: String?
    let layout : String
    let imageUrl: String?

//    enum CodingKeys: String, CodingKey {
//        case name
//        case type
//        case rarity
//        case imageUrl
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name)
//        type = try container.decode(String.self, forKey: .type)
//        rarity = try container.decode(String.self, forKey: .rarity)
//        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
//    }
}
struct CardsPage: Codable {
    let cards: [Card]
}

