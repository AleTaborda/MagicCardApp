//
//  SetsTableViewCell.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 17/06/2021.
//

import UIKit
import Kingfisher

class SetsTableViewCell: UITableViewCell {

    //MARK: - Views
    @IBOutlet var SetNameLabel: UILabel!
    @IBOutlet var SetDateLabel: UILabel!
    @IBOutlet var SetCodeLabel: UILabel!
    
    //MARK: - Configure
    func configure(for set: Set) {
        SetNameLabel.text = set.name
        SetDateLabel.text = "Release Date: \(set.releaseDate)"
        SetCodeLabel.text = "Code: \(set.code)"
    }

}
