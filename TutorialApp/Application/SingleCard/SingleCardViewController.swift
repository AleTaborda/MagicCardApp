//
//  SingleCardViewController.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 17/06/2021.
//

import UIKit
import Kingfisher


class SingleCardViewController: BaseViewController {
    
    //MARK: - Views
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var cardTypeLabel: UILabel!
    @IBOutlet var cardRarityLabel: UILabel!
    @IBOutlet var cardArtistLabel: UILabel!
    @IBOutlet var cardPowerLabel: UILabel!
    @IBOutlet var cardToughnessLabel: UILabel!
    @IBOutlet var cardLayoutLabel: UILabel!

    //MARK: - Attributes
    var card: Card!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addPlayButton()
        cardImageView.image = nil
        cardImageView.kf.cancelDownloadTask()
        self.configure(for: card)
    }
 
    //MARK: - Configure of Card
    func configure(for card: Card) {
        navigationItem.title = card.name?.capitalized
        cardTypeLabel.text = "Type: \(card.type ?? "No Data Available For This Card")"
        cardRarityLabel.text = "Rarity: \(card.rarity ?? "No Data Available For This Card")"
        cardArtistLabel.text = "Artist: \(card.artist ?? "No Data Available For This Card")"
        cardPowerLabel.text = "Power: \(card.power ?? "-")"
        cardToughnessLabel.text = "Toughness: \(card.toughness ?? "-")"
        cardLayoutLabel.text = "Layout: \(card.layout ?? "No Data Available For This Card")"
        
        let processor = DownsamplingImageProcessor(size: cardImageView.bounds.size)
        if let imageUrl = URL(string: card.imageUrl ?? "No Image Available") {
            cardImageView.kf.setImage(
                with: imageUrl,
                placeholder: UIImage(named: "placeholderImage"),
                options: [
                   .processor(processor),
                    .transition(.fade(1.2)),
                    .cacheOriginalImage
                ])
            cardImageView.layer.shadowColor = UIColor.gray.cgColor
            cardImageView.layer.shadowOffset = CGSize (width: 6.0, height: 6.0)
            cardImageView.layer.shadowOpacity = 6.0
            cardImageView.layer.masksToBounds = false
            cardImageView.layer.cornerRadius = 2.0
        }
    }
}


    
