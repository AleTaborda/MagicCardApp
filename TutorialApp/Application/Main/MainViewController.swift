//
//  MainViewController.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 10/06/2021.
//

import UIKit
import AVFoundation

final class MainViewController: BaseViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    configureViewComponents()
        
    }
    
    
    @objc func showButtonPlay() {
        musicButton()
    }

    
    @IBAction func navigateButtonPressed() {
        let setOfCardsController = SetOfCardsViewController()
        self.navigationController?.pushViewController(setOfCardsController, animated: true)
    }
    
    func configureViewComponents() {
        
        navigationController?.navigationBar.barTintColor = .mainBrown()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Magic:theGathering", size: 30)!]
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Magic Cards"
        musicButton()
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
