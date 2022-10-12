//
//  RepeatOrderVC.swift
//  ElluminatiTask
//
//  Created by macbook on 24/08/22.
//

import UIKit

class RepeatOrderVC: BaseViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var viewBgBottom: UIView!
    @IBOutlet weak var lblItemDetails: UILabel!
    @IBOutlet weak var btnCustomize: UIButton!
    @IBOutlet weak var btnRepeat: UIButton!
    
    //MARK:- Properties
    var list = [List]()
    var pakageInfo: Pakage!
    var selectedBHK = Int()
    var viewModel = PakageViewModel()
    var savedData = [SaveInfoModel]()
    var onDismissClicked: (() -> ())?
    var menuViewModel = MenuViewModel()
    var onRepeatClicked: ((String) -> ())?
    var onBackAddToCartClicked: ((Int,[List],Int) -> ())?

    //MARK:- LifeCycles
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewBgBottom.roundCorners(corners: [.topLeft,.topRight], radius: 15)
        btnCustomize.addCornerRadius(15)
        btnRepeat.addCornerRadius(15)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
  
        menuViewModel.refresh()
        
        let arrSaveData = menuViewModel.savedData
        let lastSaveData = arrSaveData.last
        
//        var arrName = [String]()
//
//        for list in list {
//            if list.is_default_selected == true {
//                arrName.append(list.name!.first!)
//            }
//        }
//        let stringList = arrName.joined(separator: ",")
//
//        let arrSpecification = pakageInfo?.specifications!
//
//        let appartment = arrSpecification!.first
//        for listData in appartment!.list! {
//            viewModel.arrListForApartment.append(listData)
//        }
//
//        let selectedBHKString = viewModel.arrListForApartment[selectedBHK].name?.first!
           
        lblItemDetails.text = lastSaveData!.selectedCatagoty
        
    }
    //MARK:- Functions
    
    //MARK:- IBActions
    @IBAction func onBtnClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBtnCustomize(_ sender: UIButton) {
        let vc = PakageVC.instantiate(fromAppStoryboard: .Main)
        vc.modalPresentationStyle = .overFullScreen
        vc.viewModel.pakageInfo = pakageInfo
        vc.onDismissClicked = {
            self.onDismissClicked?()
            self.dismiss(animated: true, completion: nil)
        }
        vc.onBackAddToCartClicked = { data,totallist,indexBHK in
            self.onBackAddToCartClicked?(data,totallist,indexBHK)
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onBtnRepeat(_ sender: UIButton) {
        let arrSaveData = menuViewModel.savedData
        let lastSaveInfo = arrSaveData.last
        
        do {
            try RealmDBServices.shared.realm.write {
                let totalItem = "\(Int(Int(lastSaveInfo!.repeatCount) ?? 1) + 1 )"
                let total = "\(Int(lastSaveInfo!.total)! * Int(totalItem)!)"
                
                lastSaveInfo?.repeatCount = totalItem
                lastSaveInfo?.finalTotal = total
                DLog(try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true))
                NotificationCenter.default.post(name: .refreshData, object: nil)
                onRepeatClicked?(totalItem)
            }
        } catch {
        
        }
        onDismissClicked?()
        self.dismiss(animated: true, completion: nil)
    }
}
