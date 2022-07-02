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
    case placeOrder(String)
    case fetchMeals(String)
    case fetchLibrary
    
    var description: String {
        switch self {
        case .fetchAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchMeals(let dishId):
            return "/dishes/\(dishId)"
        case .fetchLibrary:
            return "/orders"
        }
    }
}
