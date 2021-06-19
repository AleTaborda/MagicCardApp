//
//  CardTypeViewController.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 17/06/2021.
//

import UIKit

class SetOfCardsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    var sets: [Set] = []
    var page = 1
    var isLoading = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let nib = UINib(
            nibName: "SetsTableViewCell",
            bundle: .main
        )
        
        tableView.register(nib, forCellReuseIdentifier: "SetOfCards")
        tableView.dataSource = self
        tableView.delegate = self
        
        loadSets(page: page)
        
    }
    

    
    func loadSets(page: Int) {
        isLoading = true
        APIClient.getSets(page: page, completionHandler: { sets in
            self.sets.append(contentsOf: sets)
            self.tableView.reloadData()
            self.isLoading = false
        })
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

}

