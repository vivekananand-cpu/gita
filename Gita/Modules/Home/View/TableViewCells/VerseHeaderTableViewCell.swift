//
//  VerseHeaderTableViewCell.swift
//  Gita
//
//  Created by Vivek Thorat on 11/03/24.
//

import UIKit

class VerseHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelVerseNo: UILabel!
    
    var verseNumber: Int? {
        didSet {
            labelVerseNo.text = "Verse No. \(verseNumber ?? 0)"
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
