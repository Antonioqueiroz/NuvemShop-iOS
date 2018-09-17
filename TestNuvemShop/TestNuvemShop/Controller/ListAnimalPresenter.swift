//
//  ListAnimalPresenter.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 17/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import Foundation
protocol ListAnimalsView {
    func showLoadingWithMessage(message:String)
    func hideLoading()
    func showFailMessage(message: String)
    func showListAnimals(listAnimals: [Animal])
    
}

class ListAnimalsPresenter{
    private let serviceCats : CatServices!
    private let serviceDogs : DogServices!
    private var viewListAnimals : ListAnimalsView?
    
    init() {
        self.serviceCats = CatServices()
        self.serviceDogs = DogServices()
    }
    
    func showInView(view : ListAnimalsView){
        viewListAnimals = view
    }
    
    func hideInView(){
        viewListAnimals = nil
    }
    
    func getCats(){
        self.viewListAnimals?.showLoadingWithMessage(message: "Loading Cats...")
        serviceCats.getCats { (response) in
            self.viewListAnimals?.hideLoading()
            switch response{
            case.done(value: let result):
                self.viewListAnimals?.showListAnimals(listAnimals:result)
                break
            case.failed(message: let message):
                self.viewListAnimals?.showFailMessage(message: message)
                break
            }
        }
    }
    
    func getDogs(){
        self.viewListAnimals?.showLoadingWithMessage(message: "Loading Dogs...")
        serviceDogs.getDogs { (response) in
            self.viewListAnimals?.hideLoading()
            switch response{
            case.done(value: let result):
                self.viewListAnimals?.showListAnimals(listAnimals:result)
                break
            case.failed(message: let message):
                self.viewListAnimals?.showFailMessage(message: message)
                break
            }
        }
    }
}

