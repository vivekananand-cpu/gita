//
//  Chapter.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import Foundation

struct Chapter: Codable {
    let id: Int
    let name: String
    let nameTransliterated: String
    let nameTranslated: String
    let versesCount: Int
    let chapterNumber: Int
    let nameMeaning: String
    let chapterSummary: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case nameTransliterated = "name_transliterated"
        case nameTranslated = "name_translated"
        case versesCount = "verses_count"
        case chapterNumber = "chapter_number"
        case nameMeaning = "name_meaning"
        case chapterSummary = "chapter_summary"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.nameTransliterated = try container.decode(String.self, forKey: .nameTransliterated)
        self.nameTranslated = try container.decode(String.self, forKey: .nameTranslated)
        self.versesCount = try container.decode(Int.self, forKey: .versesCount)
        self.chapterNumber = try container.decode(Int.self, forKey: .chapterNumber)
        self.nameMeaning = try container.decode(String.self, forKey: .nameMeaning)
        self.chapterSummary = try container.decode(String.self, forKey: .chapterSummary)
    }
}




