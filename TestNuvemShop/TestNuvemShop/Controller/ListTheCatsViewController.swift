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

class ListTheCatsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter : ListAnimalsPresenter = ListAnimalsPresenter()
    var cats : [Animal] = [Animal]()
    var imageUrlSelected : String = ""
    var breedSelected : Breed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showInView(view: self)
        presenter.getCats()
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

extension ListTheCatsViewController : ListAnimalsView {
    func showListAnimals(listAnimals: [Animal]) {
        self.cats = listAnimals
        self.collectionView .reloadData()
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

extension ListTheCatsViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cats.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AnimalsCollectionViewCell
        let url = URL(string: self.cats[indexPath.row].imageUrl)
        cell.image.kf.setImage(with: url)
        return cell
    }
}

extension ListTheCatsViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cat = self.cats[indexPath.row]
        self.imageUrlSelected = cat.imageUrl
        if (!cat.breeds.isEmpty){
            self.breedSelected = cat.breeds.first!
            self.performSegue(withIdentifier: "catsDetail", sender: self)
        }else{
            self.breedSelected = nil
        }
        
    }
}


