//
//  ListCatsPresenter.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 11/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import Foundation
protocol ListCatsView {
    func showLoadingWithMessage(message:String)
    func hideLoading()
    func showFailMessage(message: String)
    func showListCats(listCats: [Cat])
    
}

class ListCatsPresenter{
    private let service : CatServices!
    private var viewListCats : ListCatsView?
    
    init() {
        self.service = CatServices()
    }
    
    func showInView(view : ListCatsView){
        viewListCats = view
    }
    
    func hideInView(){
        viewListCats = nil
    }
    
    func getCats(){
        self.viewListCats?.showLoadingWithMessage(message: "Loading Cats...")
        service.getCats { (response) in
            self.viewListCats?.hideLoading()
            switch response{
            case.done(value: let result):
                self.viewListCats?.showListCats(listCats: result)
                break
            case.failed(message: let message):
                self.viewListCats?.showFailMessage(message: message)
                break
            }
        }
    }
}
