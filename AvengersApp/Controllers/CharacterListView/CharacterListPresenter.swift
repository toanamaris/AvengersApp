//
//  CharacterListPresenter.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation


protocol CharacterListViewControllerProtocol {
    func getCharacterList(list: CharacterListModel)
    func startLoading()
    func stopLoading()
    func presenterViewDidLoad()
    func displayError(message: String)
}


class CharacterListPresenter {
    var request = AvengersAPIRequest()
    var viewController: CharacterListViewControllerProtocol?
    
    init(viewController: CharacterListViewControllerProtocol, request: AvengersAPIRequest = AvengersAPIRequest()) {
        self.viewController = viewController
        self.request = request
    }
    
    func viewDidLoad(){
        viewController?.presenterViewDidLoad()
    }
    
    func requestCharacterList(){
        viewController?.startLoading()
        request.getCharacterList(completiongHandler: {[weak self] response in
            self?.viewController?.stopLoading()
            switch response.result {
            case .success(let data):
                guard let _data = data else {return}
                self?.viewController?.getCharacterList(list: _data)
            case .failure:
                let error = AvengersErrorHandler.shared.handlerError(reponse: response)
                self?.viewController?.displayError(message: error.status)
            }
        })
    }
}
