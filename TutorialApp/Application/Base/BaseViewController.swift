//
//  BaseViewController.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 10/06/2021.
//

import UIKit


class BaseViewController: UIViewController {
    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: .main)
    }
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    @objc func showButtonPlay() {
        MusicHelper.playAndStopMusic()
    }
    func addPlayButton() {
        let playButton = UIBarButtonItem(title: "🎧", style: .plain, target: self, action: #selector(showButtonPlay))
        navigationItem.rightBarButtonItem = playButton
    }
}
