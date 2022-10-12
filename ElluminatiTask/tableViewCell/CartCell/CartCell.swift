//
//  CartCell.swift
//  ElluminatiTask
//
//  Created by macbook on 22/08/22.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var viewBgItems: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblItems: UILabel!
    @IBOutlet weak var lblItemCount: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBgItems.addCornerRadius(viewBgItems.frame.height/2)
        viewBgItems.applyBorder(2, borderColor: Application.Color.Color_menu)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
