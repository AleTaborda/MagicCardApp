//
//  ListOfMagicCardsViewController.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 16/06/2021.
//

import UIKit


class ListOfMagicCardsViewController: UIViewController {
        
    @IBOutlet var tableView: UITableView!

    
    var cards: [Card] = []
    var page = 1
    var code = ""
    var isLoading = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(
            nibName: "MagicCardsTableViewCell",
            bundle: .main
        )
        
        tableView.register(nib, forCellReuseIdentifier: "MagicCard")
        tableView.dataSource = self
        tableView.delegate = self
        
        loadCards(page: page)
    }
    
    func loadCards(page: Int) {
        
        isLoading = true
        
        APIClient.getCards(page: page, code: code, completionHandler: { cards in
            self.cards.append(contentsOf: cards)
            self.tableView.reloadData()
            self.isLoading = false
        })
    }
    
}
    
    //MARK - UITableViewDataSource
    
extension ListOfMagicCardsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagicCard") as! MagicCardsTableViewCell
        
        let card = cards[indexPath.row]
        cell.configure(for: card)
        
        return cell
    }
    
  }

extension ListOfMagicCardsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == cards.count - 5 {
            guard !isLoading else {
                return
            }

            page += 1
            loadCards(page: page)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCard = cards[indexPath.row]

        let viewController = SingleCardViewController()
        viewController.card = selectedCard
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


