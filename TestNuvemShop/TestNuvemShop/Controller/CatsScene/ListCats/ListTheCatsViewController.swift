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

class ListTheCatsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter : ListCatsPresenter = ListCatsPresenter()
    var cats : [Cat] = [Cat]()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showInView(view: self)
        presenter.getCats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ListTheCatsViewController : ListCatsView {
    func showListCats(listCats: [Cat]) {
        self.cats = listCats
        self.collectionView .reloadData()
    }
    
    func showLoadingWithMessage(message: String) {
        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Carregando.."
    }
    
    func hideLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showFailMessage(message: String) {
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catsCell", for: indexPath) as! CatsCollectionViewCell
        let url = URL(string: self.cats[indexPath.row].imageUrl)
        cell.image.kf.setImage(with: url)
        return cell
    }
}

extension ListTheCatsViewController : UICollectionViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cat = self.cats[indexPath.row]
        
//        let carDetail = CarDetailVC()
//        carDetail.car = car
//        self.navigationController?.pushViewController(carDetail, animated: true)
    }
}


