//
//  CategoryItemCell.swift
//  peopleAPI
//
//  Created by macbook on 16/08/22.
//

import UIKit

class CategoryItemCell: UITableViewCell {
 
    //MARK:- IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgSelect: UIImageView!
    
    //MARK:- Properties
    
    //MARK:- LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK:- Functions
    func setSelected(isHighlighted: Bool,selectInfo: Pakage,index: Int) {
        imgSelect.isHighlighted = isHighlighted
        let firstInfo = selectInfo.specifications?.first
        for firstInfos in firstInfo!.list! {
            var info = firstInfos
            info.is_default_selected = true
            let indexs = index
            info.sequence_number = indexs
        }
    }
    
    func config(ListInfo : List) {
        lblTitle.text = ListInfo.name?.first
        lblPrice.text = "₹ \(Double(ListInfo.price!))"
    }
    
    //MARK:- Event
    
    //MARK:- IBActions
    
}
