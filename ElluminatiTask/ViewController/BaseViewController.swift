//
//  BaseViewController.swift
//  ElluminatiTask
//
//  Created by macbook on 26/08/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func addDataRefreshNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshDataNotification(_:)), name: .refreshData, object: nil)
    }
    
    @objc func onRefreshDataNotification(_ notification: Notification) {
        
    }
}
