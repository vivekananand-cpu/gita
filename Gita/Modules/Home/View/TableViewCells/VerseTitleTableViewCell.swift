//
//  VerseTitleTableViewCell.swift
//  Gita
//
//  Created by Vivek Thorat on 11/03/24.
//

import UIKit

class VerseTitleTableViewCell: UITableViewCell {
    @IBOutlet weak var labelText: UILabel!
    
    var versePO: VersePO? {
        didSet {
            labelText.text = versePO?.text
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
