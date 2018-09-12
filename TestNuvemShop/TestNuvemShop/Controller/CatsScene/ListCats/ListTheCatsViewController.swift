//
//  ListTheCatsViewController.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 09/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import UIKit
import MBProgressHUD

class ListTheCatsViewController: UIViewController {
    var hud: MBProgressHUD = MBProgressHUD()
    var presenter : ListCatsPresenter = ListCatsPresenter()
    var cats : [Cat] = [Cat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cats"
        presenter.showInView(view: self)
        presenter.getCats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ListTheCatsViewController : ListCatsView {
    func showListCats(listCats: [Cat]) {
        print("Cats \(listCats)")
    }
    
    func showLoadingWithMessage(message: String) {
        hud.show(animated: true)
        self.hud.mode = MBProgressHUDMode.indeterminate
        self.hud.label.text = message
    }
    
    func hideLoading() {
        self.hud.hide(animated: true)
    }
    
    func showFailMessage(message: String) {
        
    }
}

