//
//  ListOfMagicCardsViewController.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 16/06/2021.
//

import UIKit

class ListOfMagicCardsViewController: BaseViewController {
     
    //MARK: - Views
    @IBOutlet var tableView: UITableView!

    //MARK: - Attributes
    var cards: [Card] = []
    var page = 1
    var code = ""
    var isLoading = false

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addPlayButton()
        configureViewComponents()
        
        let nib = UINib(
            nibName: "MagicCardsTableViewCell",
            bundle: .main
        )
        tableView.register(nib, forCellReuseIdentifier: "MagicCard")
        tableView.dataSource = self
        tableView.delegate = self
        loadCards(page: page)
    }
    
    //MARK: - Private methods
    private func loadCards(page: Int) {
        isLoading = true
        APIClient.getCards(page: page, code: code, completionHandler: { cards in
            self.cards.append(contentsOf: cards)
            self.tableView.reloadData()
            self.isLoading = false
        })
    }
    
    //MARK: - NavigationController components
    func configureViewComponents() {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Card List"
    }
}
    
//MARK: - UITableViewDataSource
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

//MARK: - UITableViewDelegate
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
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCard = cards[indexPath.row]
        let viewController = SingleCardViewController()
        viewController.card = selectedCard
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


