//
//  ImageModel.swift
//  RandomImageViewer
//
//  Created by Gizem Coşkun on 26.07.2023.
//

import Foundation

struct APIResponse: Codable {
    let total: Int?
    let totalPages: Int?
    let results: [Result]?
}
struct Result: Codable {
    let id: String
    let urls: URLS
}
struct URLS: Codable {
    let regular: String
}
