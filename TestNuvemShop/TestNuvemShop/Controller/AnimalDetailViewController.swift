//
//  AnimalDetailViewController.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 13/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import UIKit
import Kingfisher

class AnimalDetailViewController: UIViewController {
    var urlStringImage : String? = ""
    var stringBreeds : String? = ""
    var breed : Breed?
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelBreed: UILabel!
    @IBOutlet weak var labelWeigth: UILabel!
    @IBOutlet weak var labelHeigth: UILabel!
    @IBOutlet weak var labelLife_span: UILabel!
    @IBOutlet weak var labelBreedGroup: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:urlStringImage!)
        self.image.kf.setImage(with: url)
        self.labelBreed.text = ("Breed - \(breed?.name ?? "")")
        self.labelHeigth.text = ("Heigth - \(breed?.heigthMetric ?? "")")
        self.labelWeigth.text = ("Weigth - \(breed?.weigthMetric ?? "")")
        self.labelBreedGroup.text = ("Breed Group - \(breed?.breed_group ?? "")")
        self.labelLife_span.text = ("Life Span - \(breed?.life_span ?? "")")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
