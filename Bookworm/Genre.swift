//
//  Genre.swift
//  Bookworm
//
//  Created by 千々岩真吾 on 2025/01/09.
//

import Foundation

enum Genre: String, Codable, CaseIterable {
    case fantasy = "Fantasy"
    case horror = "Horror"
    case kids = "Kids"
    case mystery = "Mystery"
    case poetry = "Poetry"
    case romance = "Romance"
    case thriller = "Thriller"
}
