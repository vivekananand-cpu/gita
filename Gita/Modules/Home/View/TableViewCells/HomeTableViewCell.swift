//
//  HomeTableViewCell.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelChapterName: UILabel!
    var chapter: Chapter? {
        didSet {
            labelChapterName.text = chapter?.name
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
