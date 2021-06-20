//
//  SingleCardViewController.swift
//  TutorialApp
//
//  Created by usuario on 18/06/2021.
//

import UIKit
import Kingfisher
import AVFoundation

class SingleCardViewController: UIViewController {
    
    var card: Card!
    var player: AVAudioPlayer?
    
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var cardTypeLabel: UILabel!
    @IBOutlet var cardRarityLabel: UILabel!
    @IBOutlet var cardArtistLabel: UILabel!
    @IBOutlet var cardPowerLabel: UILabel!
    @IBOutlet var cardToughnessLabel: UILabel!
    @IBOutlet var cardLayoutLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageView.image = nil
        cardImageView.kf.cancelDownloadTask()
      
        self.configure(for: card)
        musicButton()
    }
    
    @objc func showButtonPlay() {
        musicButton()
    }
    
    func configure(for card: Card) {
        navigationItem.title = card.name?.capitalized
        cardTypeLabel.text = "Type: \(card.type ?? "No Data Available For This Card")"
        cardRarityLabel.text = "Rarity: \(card.rarity ?? "No Data Available For This Card")"
        cardArtistLabel.text = "Artist: \(card.artist ?? "No Data Available For This Card")"
        cardPowerLabel.text = "Power: \(card.power ?? "-")"
        cardToughnessLabel.text = "Toughness: \(card.toughness ?? "-")"
        cardLayoutLabel.text = "Layout: \(card.layout ?? "No Data Available For This Card")"
 

        if let imageUrl = URL(string: card.imageUrl ?? "") {
            cardImageView.kf.setImage(with: imageUrl)
            
            cardImageView.layer.shadowColor = UIColor.gray.cgColor
            cardImageView.layer.shadowOffset = CGSize (width: 6.0, height: 6.0)
            cardImageView.layer.shadowOpacity = 6.0
            cardImageView.layer.masksToBounds = false
            cardImageView.layer.cornerRadius = 2.0
        }
    }
    
    func musicButton() {
        let playButton = UIBarButtonItem(title: "🎧", style: .plain, target: self, action: #selector(showButtonPlay))
        self.navigationItem.rightBarButtonItem = playButton
        if let player = player, player.isPlaying {
            //stop playback
            
            player.stop()
        }
            else {
                // set up player and play
                let urlString = Bundle.main.path(forResource: "MagicSong", ofType: "mp3")
            
                do {
                    try AVAudioSession.sharedInstance().setMode(.default)
                    try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
                    guard let urlString = urlString else {
                        return
                    }
            
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
                    guard let player = player else  {
                        return
                    }
            
                    player.play()
                }
                catch {
                    print("Error")
                }
            }
        }
}


    
