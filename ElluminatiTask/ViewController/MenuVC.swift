//
//  ViewController.swift
//  ElluminatiTask
//
//  Created by macbook on 16/08/22.
//

import UIKit
import Realm

class MenuVC: BaseViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var viewBgRating: UIView!
    @IBOutlet weak var btnCustomize: UIButton!
    @IBOutlet weak var viewBgCustomize: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnViewCart: UIButton!
    @IBOutlet weak var lblCartItemCount: UILabel!
    @IBOutlet weak var lblRepeatItem: UILabel!
    
    //MARK:- Properties
    var viewModel = MenuViewModel()
    var pakageInfo: Pakage!
    var total = Int()
    var list =  [List]()
    var selectedBHK = Int()

    //MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.refresh()
        setupUI()
       
        checkEmptyCart()

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewBgRating.addCornerRadius(viewBgRating.frame.height/2)
        btnCustomize.addCornerRadius(btnCustomize.frame.height/2)
        lblCartItemCount.addCornerRadius(lblCartItemCount.frame.height/2)

        btnCustomize.applyBorder(1, borderColor: Application.Color.Color_menu)
        btnViewCart.addCornerRadius(btnViewCart.frame.height/2)
        
        viewBgCustomize.applyBorder(1, borderColor: Application.Color.Color_menu)
        viewBgCustomize.addCornerRadius(viewBgCustomize.frame.height/2)
    }
    
    //MARK:- Functions
    func setupUI() {
        getResponse()
        viewModel.refresh()
        self.addDataRefreshNotificationObserver()
        if viewModel.savedData.isEmpty != true {
            btnCustomize.isHidden = true
            viewBgCustomize.isHidden = false
            btnViewCart.isHidden = false
            self.lblCartItemCount.isHidden = false
            self.lblCartItemCount.text = self.viewModel.savedData.count.toString
            let arrSaveData = viewModel.savedData
            let lastSaveInfo = arrSaveData.last
          
            func repeatCount(value: String) {
                self.lblRepeatItem.text = value
            }
            lastSaveInfo?.repeatCount.isEmpty != true ? repeatCount(value: lastSaveInfo!.repeatCount) : repeatCount(value: "1")

        }
    }
    override func onRefreshDataNotification(_ notification: Notification) {
        viewModel.refresh()
    }
    func checkEmptyCart() {
        if self.viewModel.savedData.count == 0 {
            self.lblCartItemCount.isHidden = true
            self.btnViewCart.isHidden = true
            self.viewBgCustomize.isHidden = true
            self.btnCustomize.isHidden = false
        } else{
            self.lblCartItemCount.text = self.viewModel.savedData.count.toString
        }
    }
    func getResponse() {
        viewModel.getData { data in
            guard let data = data else { return }
            self.pakageInfo = data
            
            self.lblTitle.text = data.name?.first
            
            for listData in data.specifications! {
                for priceData in listData.list! {
                    if priceData.is_default_selected == true {
                        self.lblPrice.text = "₹ \(Double(priceData.price!))"
                    }
                }
            }
        }
    }
    
    //MARK:- Event
    
    //MARK:- IBActions
    @IBAction func onBtnCustomize(_ sender: UIButton) {
            let vc = PakageVC.instantiate(fromAppStoryboard: .Main)
            vc.modalPresentationStyle = .overFullScreen
            vc.viewModel.pakageInfo = pakageInfo
        vc.onDismissClicked = {
            self.btnViewCart.isHidden = false
            self.lblCartItemCount.isHidden = false
            self.viewBgCustomize.isHidden = false
            self.btnCustomize.isHidden = true
            self.setupUI()
        }
            vc.onBackAddToCartClicked = { data,totallist,indexBHK in
               
                self.btnViewCart.isHidden = false
                self.lblCartItemCount.isHidden = false
                self.viewBgCustomize.isHidden = false
                self.btnCustomize.isHidden = true
                self.setupUI()
              //  self.lblCartItemCount.text = totallist.count.toString
//                self.lblRepeatItem.text = "1"
//                var arrName = [String]()
//                
//                for list in totallist {
//                    if list.is_default_selected == true {
//                        arrName.append(list.name!.first!)
//                    }
//                }
//                let stringList = arrName.joined(separator: ",")
//               
//                let arrSpecification = self.pakageInfo!.specifications!
//             
//                let appartment = arrSpecification.first
//                for listData in appartment!.list! {
//                    self.list.append(listData)
//                }
//              
//                let selectedBHKString = self.list[self.selectedBHK].name?.first!
//                
//                
//                let listItem = selectedBHKString! + " " +  stringList
//                
//                let info = SaveInfoModel()
//                info.selectedCatagoty = listItem
//                info.total = data.toString
//                
//                RealmDBServices.shared.realm.add(info)
                
                
//
//                self.list = totallist
//                self.total = data
//
//                self.lblCartItemCount.text = "1"
//                self.selectedBHK = indexBHK
                
            }
            self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onBtnViewCart(_ sender: UIButton) {
        let vc = CartVC.instantiate(fromAppStoryboard: .Main)
        vc.arrSavedData = viewModel.savedData
//        vc.viewModel.arrIn.append(1)
//        vc.total = total
//        vc.list = list
        vc.pakageInfo = pakageInfo
        
        vc.onBtnPlusClicked = {
            let vc = RepeatOrderVC.instantiate(fromAppStoryboard: .Main)
            let navigationVC = UINavigationController(rootViewController: vc)
            navigationVC.modalPresentationStyle = .overFullScreen
            vc.savedData = self.viewModel.savedData
            vc.list = self.list
            vc.pakageInfo = self.pakageInfo
            vc.selectedBHK = self.selectedBHK
            vc.onDismissClicked = {
                self.dismiss(animated: true, completion: nil)
                self.viewModel.refresh()
                self.setupUI()
            }
            vc.onBackAddToCartClicked = { data,totallist,indexBHK in
                self.viewModel.refresh()
                self.setupUI()
                self.btnViewCart.isHidden = false
                self.lblCartItemCount.isHidden = false
                self.viewBgCustomize.isHidden = false
                self.btnCustomize.isHidden = true
            }
            
            vc.onRepeatClicked = { itemCount in
                self.lblRepeatItem.text =  itemCount
                Utility.windowMain()?.showToastAtBottom(message: "Updating exiting pakage to cart sucessfully")
            }
            
            self.present(navigationVC, animated: true, completion: nil)
        }
        
        
//        vc.selectedBHK = selectedBHK
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onBtnPlus(_ sender: UIButton) {
        let vc = RepeatOrderVC.instantiate(fromAppStoryboard: .Main)
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.modalPresentationStyle = .overFullScreen
        vc.savedData = viewModel.savedData
        vc.list = list
        vc.pakageInfo = pakageInfo
        vc.selectedBHK = selectedBHK
        vc.onDismissClicked = {
            self.dismiss(animated: true, completion: nil)
            self.viewModel.refresh()
            self.setupUI()
            
        }
        vc.onBackAddToCartClicked = { data,totallist,indexBHK in
            self.viewModel.refresh()
            self.setupUI()
            self.btnViewCart.isHidden = false
            self.lblCartItemCount.isHidden = false
            self.viewBgCustomize.isHidden = false
            self.btnCustomize.isHidden = true
        }
        
        vc.onRepeatClicked = { itemCount in
            self.lblRepeatItem.text =  itemCount
            Utility.windowMain()?.showToastAtBottom(message: "Updating exiting pakage to cart sucessfully")
        }
        
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @IBAction func onBtnMinus(_ sender: UIButton) {
    
    }
}

