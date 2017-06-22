//
//  ClientTableViewCell.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/21/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

import UIKit

class ClientTableViewCell: UITableViewCell {

    @IBOutlet weak var clientPhoto: UIImageView!
    
    @IBOutlet weak var clientName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
