//
//  Verse.swift
//  Gita
//
//  Created by Vivek Thorat on 11/03/24.
//

import Foundation

struct Verse : Codable {
    let id : Int?
    let verse_number : Int?
    let chapter_number : Int?
    let text : String?
    let translations : [Translations]?
    let commentaries : [Commentaries]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case verse_number = "verse_number"
        case chapter_number = "chapter_number"
        case text = "text"
        case translations = "translations"
        case commentaries = "commentaries"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        verse_number = try values.decodeIfPresent(Int.self, forKey: .verse_number)
        chapter_number = try values.decodeIfPresent(Int.self, forKey: .chapter_number)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        translations = try values.decodeIfPresent([Translations].self, forKey: .translations)
        commentaries = try values.decodeIfPresent([Commentaries].self, forKey: .commentaries)
    }

}

struct Commentaries : Codable {
    let id : Int?
    let description : String?
    let author_name : String?
    let language : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case description = "description"
        case author_name = "author_name"
        case language = "language"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        author_name = try values.decodeIfPresent(String.self, forKey: .author_name)
        language = try values.decodeIfPresent(String.self, forKey: .language)
    }

}

struct Translations : Codable {
    let id : Int?
    let description : String?
    let author_name : String?
    let language : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case description = "description"
        case author_name = "author_name"
        case language = "language"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        author_name = try values.decodeIfPresent(String.self, forKey: .author_name)
        language = try values.decodeIfPresent(String.self, forKey: .language)
    }

}
