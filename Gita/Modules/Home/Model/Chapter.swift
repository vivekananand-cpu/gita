//
//  Chapter.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import Foundation

struct Chapter: Codable {
    let chapterNumber : Int?
    let versesCount : Int?
    let name : String?
    let translation : String?
    let transliteration : String?
    let meaning : Meaning?
    let summary : Summary?

    enum CodingKeys: String, CodingKey {

        case chapterNumber = "chapter_number"
        case versesCount = "verses_count"
        case name = "name"
        case translation = "translation"
        case transliteration = "transliteration"
        case meaning = "meaning"
        case summary = "summary"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        chapterNumber = try values.decodeIfPresent(Int.self, forKey: .chapterNumber)
        versesCount = try values.decodeIfPresent(Int.self, forKey: .versesCount)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        translation = try values.decodeIfPresent(String.self, forKey: .translation)
        transliteration = try values.decodeIfPresent(String.self, forKey: .transliteration)
        meaning = try values.decodeIfPresent(Meaning.self, forKey: .meaning)
        summary = try values.decodeIfPresent(Summary.self, forKey: .summary)
    }

}

struct Meaning : Codable {
    let english : String?
    let hindi : String?

    enum CodingKeys: String, CodingKey {

        case english = "en"
        case hindi = "hi"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        english = try values.decodeIfPresent(String.self, forKey: .english)
        hindi = try values.decodeIfPresent(String.self, forKey: .hindi)
    }

}

struct Summary : Codable {
    let english : String?
    let hindi : String?

    enum CodingKeys: String, CodingKey {

        case english = "en"
        case hindi = "hi"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        english = try values.decodeIfPresent(String.self, forKey: .english)
        hindi = try values.decodeIfPresent(String.self, forKey: .hindi)
    }

}
