//
//  APIClient.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 17/06/2021.
//

import Foundation
import Alamofire

final class APIClient {
    
    static let baseUrl = "https://api.magicthegathering.io/v1/"
    
    static func getCards(page: Int, code: String, completionHandler: @escaping ([Card]) -> Void) {
        let request = AF.request("\(baseUrl)cards?pageSize=10&page=\(page)&set=\(code)")
        
        
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let page = try! JSONDecoder().decode(CardsPage.self, from: data)
                completionHandler(page.cards)

            case .failure(let error):
                print("Error: \(error)")
            }
        }

    }
        static func getSets(page: Int, completionHandler: @escaping ([Set]) -> Void) {
            let request = AF.request("\(baseUrl)sets?pageSize=10&page=\(page)")
            
            request.responseData { response in
                switch response.result {
                case .success(let data):
                    let page = try! JSONDecoder().decode(SetPage.self, from: data)
                    completionHandler(page.sets)

                case .failure(let error):
                    print("Error: \(error)")
                }
            }

        }
}




