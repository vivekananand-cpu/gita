//
//  VersePO.swift
//  Gita
//
//  Created by Vivek Thorat on 11/03/24.
//

import Foundation

struct VersePO {
    let verseNumber: Int?
    let text: String?
    let translations: [Translations]?
    
    init(model: Verse) {
        self.verseNumber = model.verse_number
        self.text = model.text
        self.translations = model.translations
    }
}
