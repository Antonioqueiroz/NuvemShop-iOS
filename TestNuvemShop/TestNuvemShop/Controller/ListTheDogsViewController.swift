//
//  ListTheCatsViewController.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 09/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import UIKit
import MBProgressHUD
import Kingfisher
import SCLAlertView

class ListTheDogsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter : ListAnimalsPresenter = ListAnimalsPresenter()
    var dogs : [Animal] = [Animal]()
    var imageUrlSelected : String = ""
    var breedSelected : Breed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showInView(view: self)
        presenter.getDogs()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AnimalDetailViewController
        vc.urlStringImage = self.imageUrlSelected
        vc.breed = self.breedSelected
    }
}

extension ListTheDogsViewController : ListAnimalsView {
    func showListAnimals(listAnimals: [Animal]) {
        self.dogs = listAnimals
        self.collectionView.reloadData()
    }
    
    func showLoadingWithMessage(message: String) {
        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = message
    }
    
    func hideLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showFailMessage(message: String) {
        SCLAlertView().showError("Error", subTitle:message)
    }
}

extension ListTheDogsViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AnimalsCollectionViewCell
        let url = URL(string: self.dogs[indexPath.row].imageUrl)    
        cell.image.kf.setImage(with: url)
        return cell
    }
}

extension ListTheDogsViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dog = self.dogs[indexPath.row]
        self.imageUrlSelected = dog.imageUrl
        if (!dog.breeds.isEmpty){
            self.breedSelected = dog.breeds.first!
             self.performSegue(withIdentifier: "dogsDetail", sender: self)
        }else{
            self.breedSelected = nil
        }
    }
}


