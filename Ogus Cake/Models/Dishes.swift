//
//  Dishes.swift
//  Ogus Cake
//
//  Created by AKIN on 30.06.2022.
//

import Foundation

struct Dishes: Decodable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
