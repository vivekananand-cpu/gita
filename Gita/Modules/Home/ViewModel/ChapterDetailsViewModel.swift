//
//  ChapterDetailsViewModel.swift
//  Gita
//
//  Created by Vivek Thorat on 11/03/24.
//

import Foundation

protocol ChapterDetailsViewModelProtocol {
    var chapter: Chapter? {get set}
    func getChapterId() -> Int
}

class ChapterDetailsViewModel: ChapterDetailsViewModelProtocol {
    
    var chapter: Chapter?
    func getChapterId() -> Int {
        chapter?.id ?? 0
    }
    
    
    init(chapter: Chapter) {
        self.chapter = chapter
    }
    
    func getDataForRow(row: Int) -> ChapterDetailPO? {
        switch row {
        case 0:
            return ChapterDetailPO(name: "Name", text: "\(self.chapter?.nameTranslated ?? "") (\(self.chapter?.name ?? ""))")
        case 1:
            return ChapterDetailPO(name: "Name Meaning", text: self.chapter?.nameMeaning ?? "")
        case 2:
            return ChapterDetailPO(name: "Summary", text: self.chapter?.chapterSummary ?? "")
        default:
            return nil
        }
    }
    
}
