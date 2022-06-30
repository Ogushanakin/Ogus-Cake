//
//  String+Extension.swift
//  Ogus Cake
//
//  Created by AKIN on 30.06.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
