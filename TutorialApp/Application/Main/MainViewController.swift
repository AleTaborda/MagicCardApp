//
//  MainViewController.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 10/06/2021.
//

import UIKit
import AVFoundation
import TransitionButton

final class MainViewController: BaseViewController {
    
    //MARK: - Attributes
    let button = TransitionButton(frame: CGRect(x: 80, y: 400, width: 250, height: 50))
    
    //MARK: - Views
    @objc func didTapButton() {
        button.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            self.button.stopAnimation(animationStyle: .expand, revertAfterDelay: 1) {
                let setOfCardsController = SetOfCardsViewController()
                self.navigationController?.pushViewController(setOfCardsController, animated: false)
            }
        }
    }
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addPlayButton()
        configureViewComponents()
        configureTransitionButton()
        MusicHelper.playAndStopMusic()
    }
    //MARK: - NavigationController components
    func configureViewComponents() {
        navigationController?.navigationBar.barTintColor = .mainBrown()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Magic:theGathering", size: 30)!]
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Magic Cards"
    }
    
    //MARK: - Configure of Button
    func configureTransitionButton() {
        button.backgroundColor = .black
        button.setTitle("START", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.spinnerColor = .white
        self.view.addSubview(button)
    }
}
