//
//  ChapterDeatailHeadingTableViewCell.swift
//  Gita
//
//  Created by Vivek Thorat on 11/03/24.
//

import UIKit

class ChapterDetailHeadingTableViewCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelHeading: UILabel!
    
    var detailPO: ChapterDetailPO? {
        didSet {
            labelHeading.text = detailPO?.name
            labelText.text = detailPO?.text
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
