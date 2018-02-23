//
//  TableViewCell.swift
//  SampleAmazon
//
//  Created by JJ Guo on 2/22/18.
//  Copyright © 2018 JJ Guo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var url: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
