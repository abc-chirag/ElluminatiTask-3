//
//  AdditionalCategoryCell.swift
//  ElluminatiTask
//
//  Created by macbook on 20/08/22.
//

import UIKit
protocol selectItemDelegate: AnyObject {
    func selectSubCategoryItemCount(count: Int, info: List)    
}

class AdditionalCategoryCell: UITableViewCell {

    @IBOutlet weak var imgSelect: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewBgItems: UIView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblNoOfItem: UILabel!
    
    var delegate: selectItemDelegate?
    var selectedInfo : List!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        viewBgItems.addCornerRadius(viewBgItems.frame.height/2)
        viewBgItems.applyBorder(2, borderColor: Application.Color.Color_menu)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setSelected(isHighlighted: Bool, selectInfo: List, index: Int,isSelectionMode: Bool) {
         imgSelect.isHighlighted = isHighlighted
         viewBgItems.isHidden = !isHighlighted
         lblPrice.isHidden = isHighlighted
         var info = selectInfo
         info.is_default_selected = true
         selectedInfo = info
        if isSelectionMode == true {
            if isHighlighted == true {
                delegate?.selectSubCategoryItemCount(count: 1, info: selectedInfo)
            }
        }
       
     }
    
    func config(ListInfo : List) {
        lblTitle.text = ListInfo.name?.first
        if ListInfo.price! == 0 {
            lblPrice.isHidden = true
        } else {
            lblPrice.isHidden = false
            lblPrice.text = "₹ \(Double(ListInfo.price!))"
        }
    }
    @IBAction func onBtnMinus(_ sender: UIButton) {
        let value = Int(lblNoOfItem.text!)
        let total = value! - 1
        if total >= 1 {
            lblNoOfItem.text = "\(total)"
        }
        delegate?.selectSubCategoryItemCount(count: -total,info: selectedInfo)
    }
    
    @IBAction func onBtnPlus(_ sender: UIButton) {
        let value = Int(lblNoOfItem.text!)
        let total = value! + 1
        if total <= 50 {
            lblNoOfItem.text = "\(total)"
        }
        delegate?.selectSubCategoryItemCount(count: total,info: selectedInfo)
    }
}
