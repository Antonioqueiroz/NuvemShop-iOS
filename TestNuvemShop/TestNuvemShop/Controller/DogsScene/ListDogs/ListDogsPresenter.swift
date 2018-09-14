//
//  ListDogsPresenter.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 13/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import Foundation
protocol ListDogsView {
    func showLoadingWithMessage(message:String)
    func hideLoading()
    func showFailMessage(message: String)
    func showListDogs(listDogs: [Dog])
    
}

class ListDogsPresenter{
    private let service : DogServices!
    private var viewListDogs : ListDogsView?
    
    init() {
        self.service = DogServices()
    }
    
    func showInView(view : ListDogsView){
        viewListDogs = view
    }
    
    func hideInView(){
        viewListDogs = nil
    }
    
    func getDogs(){
        self.viewListDogs?.showLoadingWithMessage(message: "Loading Dogs...")
        service.getDogs { (response) in
            self.viewListDogs?.hideLoading()
            switch response{
            case.done(value: let result):
                self.viewListDogs?.showListDogs(listDogs: result)
                break
            case.failed(message: let message):
                self.viewListDogs?.showFailMessage(message: message)
                break
            }
        }
    }
}
