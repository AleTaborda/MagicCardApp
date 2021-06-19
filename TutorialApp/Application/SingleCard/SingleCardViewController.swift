//
//  SingleCardViewController.swift
//  TutorialApp
//
//  Created by usuario on 18/06/2021.
//

import UIKit
import Kingfisher

class SingleCardViewController: UIViewController {
    
    var card: Card!
    
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var cardNameLabel: UILabel!
//    @IBOutlet var cardTypeLabel: UILabel!
//    @IBOutlet var cardRarityLabel: UILabel!
//    @IBOutlet var cardManaCostLabel: UILabel!
//    @IBOutlet var cardPowerLabel: UILabel!
//    @IBOutlet var cardToughnessLabel: UILabel!
//    @IBOutlet var cardLayoutLabel: UILabel!
//    @IBOutlet var cardTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageView.image = nil
        cardImageView.kf.cancelDownloadTask()
      
        self.configure(for: card)
        
    }
//
    func configure(for card: Card) {
//        cardNameLabel.text = card.name
//        cardTypeLabel.text = card.type
//        cardRarityLabel.text = card.rarity
//        cardManaCostLabel.text = card.manaCost
//        cardPowerLabel.text = card.power
//        cardToughnessLabel.text = card.toughness
//        cardLayoutLabel.text = card.layout
//        cardTextLabel.text = card.text

        if let imageUrl = URL(string: card.imageUrl ?? "") {
            cardImageView.kf.setImage(with: imageUrl)
            
            cardImageView.layer.shadowColor = UIColor.gray.cgColor
            cardImageView.layer.shadowOffset = CGSize (width: 6.0, height: 6.0)
            cardImageView.layer.shadowOpacity = 6.0
            cardImageView.layer.masksToBounds = false
            cardImageView.layer.cornerRadius = 2.0
        }
    }
}


    
