//
//  ApiResponse.swift
//  Ogus Cake
//
//  Created by AKIN on 1.07.2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
