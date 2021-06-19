//
//  MagicCardsTableViewCell.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 16/06/2021.
//

import UIKit
import Kingfisher

class MagicCardsTableViewCell: UITableViewCell {

    @IBOutlet var cardNameLabel: UILabel!
    @IBOutlet var cardTypeLabel: UILabel!
    @IBOutlet var cardImageView: UIImageView!
   
    override func prepareForReuse() {
        super.prepareForReuse()

        cardImageView.image = nil
        cardImageView.kf.cancelDownloadTask()
    }
        
    func configure(for card: Card) {
        cardNameLabel.text = card.name
        cardTypeLabel.text = card.type
        
        if let imageUrl = URL(string: card.imageUrl ?? "") {
            cardImageView.kf.setImage(with: imageUrl)
        }
    }
}

