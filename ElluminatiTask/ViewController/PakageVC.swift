//
//  PakageVC.swift
//  ElluminatiTask
//
//  Created by macbook on 18/08/22.
//

import UIKit

class PakageVC: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblCategoty: UITableView!
    @IBOutlet weak var viewBgTotal: UIView!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lctTblCategoryHeight: NSLayoutConstraint!
    @IBOutlet weak var viewBgScroll: UIScrollView!
    @IBOutlet weak var viewBgItems: UIView!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblNoOfItem: UILabel!
    
    //MARK: - Properties
    var viewModel = PakageViewModel()
    //  var arrSelectedIndex = [Int]()
    var arrSelectedBedroom = [Int]()
    var arrSelectedBathroom = [Int]()
    var arrSelectedLivingRoom = [Int]()
    var arrSelectedKitchen = [Int]()
    var fromBtnPlus = Bool()
    var onBackAddToCartClicked: ((Int,[List],Int) -> ())?
    var onDismissClicked: (() -> ())?
    var selectionModeEnable: Bool = false
    
    var total: Int = 999
    var arrTotal = [Int]()
    var arrTotalList = [List]()
    var arrTotalInfo = [String]()
    var isselected : Bool = false
    var finalTotal = Int()
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.lctTblCategoryHeight.constant = self.tblCategoty.contentSize.height
    }
    
    //MARK: - Functions
    func setupUI() {
        setupTableView()
        getResponse()
        selectionModeEnable = false
        viewBgTotal.addCornerRadius(viewBgTotal.frame.height/2)
        viewBgItems.addCornerRadius(viewBgItems.frame.height/2)
        viewBgItems.applyBorder(2, borderColor: Application.Color.Color_menu)
        
    }
    
    private func setupTableView() {
        tblCategoty.delegate = self
        tblCategoty.dataSource = self
        tblCategoty.register(categoryCell.nib, forHeaderFooterViewReuseIdentifier: categoryCell.identifier)
        tblCategoty.register(emptycell.nib, forHeaderFooterViewReuseIdentifier: emptycell.identifier)

        //   tblCategoty.register(NoteCell.nib, forHeaderFooterViewReuseIdentifier: NoteCell.identifier)
        
        tblCategoty.register(NoteCell.nib, forCellReuseIdentifier: NoteCell.identifier)
        tblCategoty.register(emptycell.nib, forCellReuseIdentifier: emptycell.identifier)

        tblCategoty.register(CategoryItemCell.nib, forCellReuseIdentifier: CategoryItemCell.identifier)
        tblCategoty.register(AdditionalCategoryCell.nib, forCellReuseIdentifier: AdditionalCategoryCell.identifier)
        viewModel.arrSelectedIndex.append(0)
        tblCategoty.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblCategoty.allowsMultipleSelection = true
        tblCategoty.reloadData()
    }
    func refreshData() {
        getResponse()
        tblCategoty.reloadData()
    }
    func getResponse() {
        viewModel.arrListForApartment.removeAll()
        viewModel.arrListForBedRoom.removeAll()
        viewModel.arrListForBathroomCleaning.removeAll()
        viewModel.arrLivingRoomDiningRoomCleaning.removeAll()
        viewModel.arrListForKitchenCleaning.removeAll()
        
        let pakageInfo = viewModel.pakageInfo
        let arrSpecification = pakageInfo?.specifications!
        
        
        lblTitle.text = pakageInfo?.name?.first
        
        // For ApartmentSize
        let appartment = arrSpecification!.first
        for listData in appartment!.list! {
            viewModel.arrListForApartment.append(listData)
        }
        var prize: List!
        for index in viewModel.arrSelectedIndex {
            prize = viewModel.arrListForApartment[index]
            
        }
        lblTotal.text = "Add To Cart - ₹ \(Double(prize.price!))"
        
        // For BedRoomCleaning
        for bedRoomClean in arrSpecification! {
            if bedRoomClean._id == "621da898abb8a52242c1830f" {
                for (i,vals) in viewModel.arrListForApartment.enumerated() {
                    if viewModel.arrSelectedIndex.first == i {
                        if vals.name?.first == bedRoomClean.modifierName {
                            for listData in bedRoomClean.list! {
                                viewModel.arrListForBedRoom.append(listData)
                            }
                        }
                    }
                }
            }
        }
        // For Bathroom Cleaning
        for bedRoomClean in arrSpecification! {
            if bedRoomClean._id == "621da831abb8a52242c18254" {
                for (i,vals) in viewModel.arrListForApartment.enumerated() {
                    if viewModel.arrSelectedIndex.first == i {
                        if vals.name?.first == bedRoomClean.modifierName {
                            for listData in bedRoomClean.list! {
                                viewModel.arrListForBathroomCleaning.append(listData)
                            }
                        }
                    }
                }
            }
        }
        
        // Living Room/Dining Room Cleaning
        for livingDining in arrSpecification! {
            if livingDining._id == "621da88cabb8a52242c18308" {
                for (i,vals) in viewModel.arrListForApartment.enumerated() {
                    if viewModel.arrSelectedIndex.first == i {
                        if vals.name?.first == livingDining.modifierName {
                            for listData in livingDining.list! {
                                viewModel.arrLivingRoomDiningRoomCleaning.append(listData)
                            }
                        }
                    }
                }
            }
        }
        // kitchen
        for livingDining in arrSpecification! {
            if livingDining._id == "621da87dabb8a52242c182dc" {
                for (i,vals) in viewModel.arrListForApartment.enumerated() {
                    if viewModel.arrSelectedIndex.first == i {
                        if vals.name?.first == livingDining.modifierName {
                            for listData in livingDining.list! {
                                viewModel.arrListForKitchenCleaning.append(listData)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func valueMinus() {
        let value = Int(lblNoOfItem.text!)
        let total = value! - 1
        if total >= 1 {
            lblNoOfItem.text = "\(total)"
            var prize: List!
            for index in viewModel.arrSelectedIndex {
                prize = viewModel.arrListForApartment[index]
                
            }
            if selectionModeEnable == false {
                let plusTotal = prize.price! * total
                lblTotal.text = "Add To Cart - ₹ \(Double(plusTotal))"
            } else {
                let plusTotal = finalTotal * total
                lblTotal.text = "Add To Cart - ₹ \(Double(plusTotal))"
            }        }
    }
    
    private func valuePlus() {
        let value = Int(lblNoOfItem.text!)
        let total = value! + 1
        if total <= 50 {
            lblNoOfItem.text = "\(total)"
            var prize: List!
            for index in viewModel.arrSelectedIndex {
                prize = viewModel.arrListForApartment[index]
                
            }
            if selectionModeEnable == false {
                let plusTotal = prize.price! * total
                lblTotal.text = "Add To Cart - ₹ \(Double(plusTotal))"
            } else {
                let plusTotal = finalTotal * total
                lblTotal.text = "Add To Cart - ₹ \(Double(plusTotal))"
            }
            
        }
    }
    
    private func additionalCategoryValuePlusMinus(cell: AdditionalCategoryCell) {
        cell.btnPlus.addTarget(self, action: #selector(self.onCellBtnPlus), for: .touchUpInside)
        cell.btnMinus.addTarget(self, action: #selector(self.onCellBtnMinus), for: .touchUpInside)
        
    }
    private func repeatData(info: SaveInfoModel) -> Bool {
        let menuViewmodel = MenuViewModel()
        menuViewmodel.refresh()
        if menuViewmodel.savedData.isEmpty != true {
            menuViewmodel.refresh()
            for infoMenu in menuViewmodel.savedData {
                if infoMenu.selectedCatagoty == info.selectedCatagoty && infoMenu.total == info.total {
                    infoMenu.repeatCount = "\(Int(Int(infoMenu.repeatCount) ?? 1) + 1 )"
                    infoMenu.finalTotal = "\(Int(infoMenu.total)! * Int(infoMenu.repeatCount)!)"
                    Utility.windowMain()?.showToastAtBottom(message: "Updating exiting pakage to cart sucessfully")
                    return true
                }
            }
            return false
        } else {
            RealmDBServices.shared.realm.add(info)
            Utility.windowMain()?.showToastAtBottom(message: "Adding new pakage to cart sucessfully")
            return true
        }
    }
    
    //MARK: - IBActions
    @IBAction func onBtnBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBtnPlus(_ sender: UIButton) {
        valuePlus()
    }
    
    @IBAction func onBtnMinus(_ sender: UIButton) {
        valueMinus()
    }
    
    @objc private func onCellBtnPlus(sender: UIButton) {
        //       fromBtnPlus = false
        //        tblCategoty.reloadData()
    }
    
    @objc private func onCellBtnMinus(sender: UIButton) {
        //        fromBtnPlus = true
        //        tblCategoty.reloadData()
    }
    
    @IBAction func onBtnAddtoCart(_ sender: UIButton) {
        
        onBackAddToCartClicked?(total,arrTotalList,viewModel.arrSelectedIndex.first!)
        
        //        var arrName = [String]()
        //
        //        for list in arrTotalList {
        //            if list.is_default_selected == true {
        //                arrName.append(list.name!.first!)
        //            }
        //        }
        let stringList = arrTotalInfo.joined(separator: ",")
        
        let arrSpecification = viewModel.pakageInfo!.specifications!
        
        let appartment = arrSpecification.first
        for listData in appartment!.list! {
            self.viewModel.arrListForApartment.append(listData)
        }
        
        let selectedBHKString = self.viewModel.arrListForApartment[self.viewModel.arrSelectedIndex.first!].name?.first!
        let selectedBHKPrice = self.viewModel.arrListForApartment[self.viewModel.arrSelectedIndex.first!].price!
        
        let listItem = selectedBHKString! + " , " +  stringList
        
        let info = SaveInfoModel()
        let menuViewmodel = MenuViewModel()
        do {
            try RealmDBServices.shared.realm.write {
                info.selectedCatagoty = listItem
                //                info.selectedCatagotyPrice = selectedBHKPrice.toString
                
                let finalPrice = selectedBHKPrice + arrTotal.sum()
                
                info.total = finalPrice.toString
                info.finalTotal = finalPrice.toString
                info.repeatCount = "1"
                //                info.total = total.toString//self.arrSelectedIndex.first!.toString

                if repeatData(info: info) == false {
                    RealmDBServices.shared.realm.add(info)
                    Utility.windowMain()?.showToastAtBottom(message: "Adding new pakage to cart sucessfully")
                }
            
                DLog(try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true))
                NotificationCenter.default.post(name: .refreshData, object: nil)
                
            }
        } catch {
            
        }
        
        onDismissClicked?()
        
        self.dismiss(animated: true, completion: nil)
        
    }
}

//MARK:- UITableViewDelegate,UITableViewDataSource
extension PakageVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.arrpakageOptions.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.arrpakageOptions[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        lctTblCategoryHeight.constant = tblCategoty.contentSize.height
        if section == viewModel.arrpakageOptions.count - 1 {
            let empCell = Bundle.main.loadNibNamed(emptycell.identifier, owner: self, options: nil)?.first as? emptycell
            return empCell
        } else {
            let headerCell = Bundle.main.loadNibNamed(categoryCell.identifier, owner: self, options: nil)?.first as? categoryCell
            headerCell?.lblCategoryName.text = viewModel.arrpakageOptions[section].rawValue
            
            if section == viewModel.arrpakageOptions.count - 2 {
                headerCell?.lblChoose1.isHidden = true
            } else {
                headerCell?.lblChoose1.isHidden = false

            }
            return headerCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == viewModel.arrpakageOptions.count - 1 {
            return 0

        } else if section == viewModel.arrpakageOptions.count - 2 {
            return 0

        } else{
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch viewModel.arrpakageOptions[section] {
        case .apartmentSize:
            return viewModel.arrListForApartment.count
        case .bedroomCleaning:
            return viewModel.arrListForBedRoom.count
        case .bathroomCleaning:
            return viewModel.arrListForBathroomCleaning.count
        case .livingRoomDiningRoomCleaning:
            return viewModel.arrLivingRoomDiningRoomCleaning.count
        case .kitchenCleaning:
            return viewModel.arrListForKitchenCleaning.count
        case .note:
            return 1
        case .notes:
            return 1
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryItemCell.identifier) as? CategoryItemCell else{return UITableViewCell()}
        
        guard let additionalCell = tableView.dequeueReusableCell(withIdentifier: AdditionalCategoryCell.identifier) as? AdditionalCategoryCell else{return UITableViewCell()}
        
        guard let noteCell = tableView.dequeueReusableCell(withIdentifier: NoteCell.identifier) as? NoteCell else{return UITableViewCell()}
        guard let emptyCell = tableView.dequeueReusableCell(withIdentifier: emptycell.identifier) as? emptycell else{return UITableViewCell()}
      
        
        additionalCell.delegate = self
        lctTblCategoryHeight.constant = tblCategoty.contentSize.height

        switch viewModel.arrpakageOptions[indexPath.section] {
            
        case .apartmentSize:
            
            let apartmentInfo = viewModel.arrListForApartment[indexPath.row]
            cell.setSelected(isHighlighted: viewModel.arrSelectedIndex.contains(indexPath.row),selectInfo: viewModel.pakageInfo,index: indexPath.row)
            cell.config(ListInfo: apartmentInfo)
            return cell
            
        case .bedroomCleaning:
            let bedroomInfo = viewModel.arrListForBedRoom[indexPath.row]
            additionalCell.setSelected(isHighlighted: arrSelectedBedroom.contains(indexPath.row),selectInfo: bedroomInfo,index: indexPath.row,isSelectionMode: selectionModeEnable)
            additionalCell.config(ListInfo: bedroomInfo)
            
            //            additionalCell.btnPlus.addTarget(self, action: #selector(self.onCellBtnPlus), for: .touchUpInside)
            //            additionalCell.btnMinus.addTarget(self, action: #selector(self.onCellBtnMinus), for: .touchUpInside)
            return additionalCell
        case .bathroomCleaning:
            let bathroomInfo = viewModel.arrListForBathroomCleaning[indexPath.row]
            additionalCell.setSelected(isHighlighted: arrSelectedBathroom.contains(indexPath.row),selectInfo: bathroomInfo,index: indexPath.row,isSelectionMode: selectionModeEnable)
            additionalCell.config(ListInfo: bathroomInfo)
            return additionalCell
        case .livingRoomDiningRoomCleaning:
            let livingDiningInfo = viewModel.arrLivingRoomDiningRoomCleaning[indexPath.row]
            additionalCell.setSelected(isHighlighted: arrSelectedLivingRoom.contains(indexPath.row),selectInfo: livingDiningInfo,index: indexPath.row,isSelectionMode: selectionModeEnable)
            additionalCell.config(ListInfo: livingDiningInfo)
            return additionalCell
        case .kitchenCleaning:
            let kitchenInfo = viewModel.arrListForKitchenCleaning[indexPath.row]
            additionalCell.setSelected(isHighlighted: arrSelectedKitchen.contains(indexPath.row),selectInfo: kitchenInfo,index: indexPath.row,isSelectionMode: selectionModeEnable)
            additionalCell.config(ListInfo: kitchenInfo)
            return additionalCell
        case .note:
            return noteCell
        case .notes:
            return emptyCell

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectionModeEnable = true
        if selectionModeEnable == true {
            switch viewModel.arrpakageOptions[indexPath.section] {
            case .apartmentSize:
                viewModel.arrSelectedIndex.removeAll()
                viewModel.arrSelectedIndex.append(indexPath.row)
                viewModel.generateOptionArray()
                refreshData()

            case .bedroomCleaning:
                
                if arrSelectedBedroom.first == indexPath.row {
                    finalTotal = finalTotal - arrTotal.sum()
                    lblNoOfItem.text = "1"
                    lblTotal.text = "Add To Cart - ₹ \(Double(finalTotal))"
                    arrTotal.removeAll()
                    arrTotalInfo.removeAll()

                    refreshData()

                }
                
                if arrSelectedBedroom.first == indexPath.row {
                    for (i, index) in arrSelectedBedroom.enumerated() where index == indexPath.row {
                        arrSelectedBedroom.remove(at: i)
                        break
                    }
                    refreshData()

                    
                } else {
                    arrTotal.removeAll()
                    arrTotalInfo.removeAll()

                    arrSelectedBedroom.removeAll()
                    arrSelectedBedroom.append(indexPath.row)
                    refreshData()

                }
                
                
            case .bathroomCleaning:
                
                if arrSelectedBathroom.first == indexPath.row {
                    finalTotal = finalTotal - arrTotal.sum()
                    lblNoOfItem.text = "1"
                    lblTotal.text = "Add To Cart - ₹ \(Double(finalTotal))"
                    arrTotal.removeAll()
                    arrTotalInfo.removeAll()

                    refreshData()

                }
                
                if arrSelectedBathroom.first == indexPath.row  {
                    for (i, index) in arrSelectedBathroom.enumerated() where index == indexPath.row {
                        arrSelectedBathroom.remove(at: i)
                        break
                    }
                    refreshData()

                } else {
                    arrTotal.removeAll()
                    arrTotalInfo.removeAll()

                    arrSelectedBathroom.removeAll()
                    arrSelectedBathroom.append(indexPath.row)
                    refreshData()
                }
            case .livingRoomDiningRoomCleaning:
                
                if arrSelectedLivingRoom.first == indexPath.row {
                    finalTotal = finalTotal - arrTotal.sum()
                    lblNoOfItem.text = "1"
                    lblTotal.text = "Add To Cart - ₹ \(Double(finalTotal))"
                    arrTotal.removeAll()
                    arrTotalInfo.removeAll()

                    refreshData()
                }
                
                if arrSelectedLivingRoom.first == indexPath.row  {
                    for (i, index) in arrSelectedLivingRoom.enumerated() where index == indexPath.row {
                        arrSelectedLivingRoom.remove(at: i)
                        break
                    }
                    refreshData()
                    
                } else {
                    arrTotal.removeAll()
                    arrTotalInfo.removeAll()
                    arrSelectedLivingRoom.removeAll()
                    arrSelectedLivingRoom.append(indexPath.row)
                    refreshData()
                    
                }
            case .kitchenCleaning:
                
                if arrSelectedKitchen.first == indexPath.row {
                    finalTotal = finalTotal - arrTotal.sum()
                    lblNoOfItem.text = "1"
                    lblTotal.text = "Add To Cart - ₹ \(Double(finalTotal))"
                    arrTotalInfo.removeAll()
                    arrTotal.removeAll()
                    refreshData()
                }
                
                if arrSelectedKitchen.first == indexPath.row {
                    for (i, index) in arrSelectedKitchen.enumerated() where index == indexPath.row {
                        arrSelectedKitchen.remove(at: i)
                        break
                    }
                    refreshData()

                } else {
                    arrTotal.removeAll()
                    arrTotalInfo.removeAll()
                    arrSelectedKitchen.removeAll()
                    arrSelectedKitchen.append(indexPath.row)
                    refreshData()

                }
            case .note:
                tblCategoty.reloadData()
                tblCategoty.invalidateIntrinsicContentSize()
            case .notes:
                tblCategoty.reloadData()
                tblCategoty.invalidateIntrinsicContentSize()
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension PakageVC: selectItemDelegate {
    
    func selectSubCategoryItemCount(count: Int, info: List) {
        var prize: List!
        for index in viewModel.arrSelectedIndex {
            prize = viewModel.arrListForApartment[index]
        }
        let itemPrice = info.price!
        let totalPrice = itemPrice * count
        total =  prize.price!
        
        arrTotal.append(totalPrice)
        if arrTotal.isEmpty == false {
            finalTotal = total + arrTotal.sum()
            lblTotal.text = "Add To Cart - ₹ \(Double(total) + Double(arrTotal.sum()))"
        }
        
        let selectedInfoName = (info.name?.first!)! + "(\(count))"
        
        arrTotalInfo.append(selectedInfoName)
        arrTotalList.append(info)
    }
}
extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}
