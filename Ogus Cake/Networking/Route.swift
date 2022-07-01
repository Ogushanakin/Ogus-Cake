//
//  Route.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import Foundation

enum Route {
    static let baseUrl = "https://ogus-cake.glitch.me"
    //"https://yummie.glitch.me"
    
    case fetchAllCategories
    
    var description: String {
        switch self {
        case .fetchAllCategories: return "/dish-categories"
        }
    }
}
