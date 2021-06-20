//
//  Sets.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 17/06/2021.
//

import UIKit

struct Set: Codable {
    let name: String
    let releaseDate: String
    let code: String

//This part is not necessary because the keys have the same name that the API call
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case releaseDate
//        case code
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name)
//        releaseDate = try container.decode(String.self, forKey: .releaseDate)
//        code = try container.decode(String.self, forKey: .code)
//    }
}

struct SetPage: Codable {
    let sets: [Set]
}
