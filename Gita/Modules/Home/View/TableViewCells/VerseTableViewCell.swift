//
//  VerseTableViewCell.swift
//  Gita
//
//  Created by Vivek Thorat on 11/03/24.
//

import UIKit

class VerseTableViewCell: UITableViewCell {
    @IBOutlet weak var labelAuthorName: UILabel!
    @IBOutlet weak var labelTranslation: UILabel!
    @IBOutlet weak var labelLanguage: UILabel!
    
    var translation: Translations? {
        didSet {
            labelAuthorName.text = translation?.author_name
            labelLanguage.text = translation?.language
            labelTranslation.text = translation?.description
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
