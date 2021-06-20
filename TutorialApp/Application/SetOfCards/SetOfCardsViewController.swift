//
//  CardTypeViewController.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 17/06/2021.
//

import UIKit
import AVFoundation

class SetOfCardsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    var sets: [Set] = []
    var page = 1
    var isLoading = false
    var player: AVAudioPlayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()

        let nib = UINib(
            nibName: "SetsTableViewCell",
            bundle: .main
        )
        
        tableView.register(nib, forCellReuseIdentifier: "SetOfCards")
        tableView.dataSource = self
        tableView.delegate = self
        
        loadSets(page: page)
        
    }
    
    @objc func showButtonPlay() {
        musicButton()
    }
    
    func loadSets(page: Int) {
        isLoading = true
        APIClient.getSets(page: page, completionHandler: { sets in
            self.sets.append(contentsOf: sets)
            self.tableView.reloadData()
            self.isLoading = false
        })
    }
    
    func configureViewComponents() {
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.title = "Set List"
        musicButton()
    }

}



extension SetOfCardsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SetOfCards") as! SetsTableViewCell
        
        let set = sets[indexPath.row]
        cell.configure(for: set)
        
        return cell
    }
    
  }

extension SetOfCardsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == sets.count - 5 {
            guard !isLoading else {
                return
            }

            page += 1
            loadSets(page: page)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedSet = sets[indexPath.row]
        
        let viewController = ListOfMagicCardsViewController()
        viewController.code = selectedSet.code
        self.navigationController?.pushViewController(viewController, animated: true)
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

