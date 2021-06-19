//
//  MainViewController.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 10/06/2021.
//

import UIKit

final class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func navigateButtonPressed() {
        let setOfCardsController = SetOfCardsViewController()
        self.navigationController?.pushViewController(setOfCardsController, animated: true)
    }
    

}
