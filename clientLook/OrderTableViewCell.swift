//
//  OrderTableViewCell.swift
//  clientLook
//
//  Created by Cyrus Zhang on 6/22/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

import UIKit



class OrderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemBrand: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var orderTime: UILabel!
    @IBOutlet weak var asscoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
