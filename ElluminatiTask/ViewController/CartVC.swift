//
//  CartVC.swift
//  ElluminatiTask
//
//  Created by macbook on 22/08/22.
//

import UIKit

class CartVC: BaseViewController {
    
    @IBOutlet weak var tblCart: UITableView!
    @IBOutlet weak var viewBgTotal: UIView!
    
    @IBOutlet weak var lblTotal: UILabel!

    var viewModel = PakageViewModel()
    var total = Int()
    var list = [List]()
    var pakageInfo: Pakage!
    var selectedBHK = Int()
    var arrSavedData = [SaveInfoModel]()
    var menuViewModel = MenuViewModel()
    var onBtnPlusClicked: (() -> ())?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getTotalPrice()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewBgTotal.addCornerRadius(viewBgTotal.frame.height/2)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        menuViewModel.refresh()
    }
    private func setupTableView() {
        tblCart.delegate = self
        tblCart.dataSource = self
        tblCart.register(CartCell.nib, forCellReuseIdentifier: CartCell.identifier)
        tblCart.reloadData()
    }
    
    func getTotalPrice() {
        var arrTotalPrice = [Int]()
        menuViewModel.refresh()
        arrTotalPrice.removeAll()
        for totalPrice in menuViewModel.savedData {
            let total = Int(totalPrice.finalTotal)
            arrTotalPrice.append(total!)
        }
        lblTotal.text = "Checkout-₹ \(Double(arrTotalPrice.sum()))"
    }
    
    @IBAction func onBtnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onBtnCheckOut(_ sender: UIButton) {
        
    }
    @objc private func onCellBtnDelete(sender: UIButton) {
        let delAction = UIAlertController(title: "Delete pakage", message: "Are you sure you want to delete this pakage ?", preferredStyle: .alert)
        delAction.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        delAction.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let info = sender.tag
            let deleteInfo = self.menuViewModel.savedData[info]
            _ = RealmDBServices.shared.delete(deleteInfo)
            self.menuViewModel.refresh()
            self.tblCart.reloadData()
            self.getTotalPrice()
            if self.menuViewModel.savedData.isEmpty == true {
                self.navigationController?.popViewController(animated: true)
            }
            Utility.windowMain()?.showToastAtBottom(message: "Pakage delete sucessfully")

        }))
        self.present(delAction, animated: true, completion: nil)
                                          
        
        
       
    }
    @objc private func onCellBtnPlus(sender: UIButton) {
        let info = sender.tag
        self.navigationController?.popViewController(animated: true)
        onBtnPlusClicked?()

    }
}
//MARK:- UITableViewDelegate,UITableViewDataSource
extension CartVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuViewModel.savedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.identifier) as? CartCell else{return UITableViewCell()}
        
        cell.lblTitle.text = pakageInfo.name?.first
        let info = menuViewModel.savedData[indexPath.row]
        let total = Int(info.finalTotal)
        cell.lblItems.text = info.selectedCatagoty
        
        cell.lblTotal.text = "\(Double(total!))"
        func repeatCount(value: String) {
            cell.lblItemCount.text = value
        }
        info.repeatCount.isEmpty != true ? repeatCount(value: info.repeatCount) : repeatCount(value: "1")
        cell.btnCancel.addTarget(self, action: #selector(self.onCellBtnDelete), for: .touchUpInside)
        cell.btnPlus.addTarget(self, action: #selector(self.onCellBtnPlus), for: .touchUpInside)
        cell.btnPlus.tag = indexPath.row

        cell.btnCancel.tag = indexPath.row
        // cell.configer(info: viewModel.arrNewsIdenti[indexPath.row])
//        cell.lblTotal.text = "₹ \(Double(total))"
//        if list.isEmpty != true {
//            var arrName = [String]()
//
//            for list in list {
//                if list.is_default_selected == true {
//                    arrName.append(list.name!.first!)
//                }
//            }
//            let stringList = arrName.joined(separator: ",")
//
//            cell.lblTitle.text = stringList
//        } else {
//            cell.lblItems.text =  ""
//
//        }
//        cell.lblTitle.text = pakageInfo.name?.first
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 130
    }
    
}
