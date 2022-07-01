//
//  AllDishes.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [Dishes]?
    let workouts: [Model]?
    let books: [Model]?
}
