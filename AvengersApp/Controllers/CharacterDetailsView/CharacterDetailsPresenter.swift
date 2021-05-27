//
//  CharacterDetailsPresenter.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import Foundation

protocol CharacterDetailsViewControllerProtocol {
    func getCharacterDetails(data: CharacterDetailsModel)
    func startLoading()
    func stopLoading()
    func presenterViewDidLoad()
    func displayError(message: String)
}
class CharacterDetailsPresenter {
    var request = AvengersAPIRequest()
    var viewController: CharacterDetailsViewControllerProtocol?
    var id = ""
    
    init(viewController: CharacterDetailsViewControllerProtocol, request: AvengersAPIRequest = AvengersAPIRequest()) {
        self.viewController = viewController
        self.request = request
    }
    
    func viewDidLoad(){
        viewController?.presenterViewDidLoad()
    }
    
    func getCharacterDetails(){
        viewController?.startLoading()
        request.getCharacterDetail(id: id, completiongHandler: {[weak self] response in
            self?.viewController?.stopLoading()
            switch response.result {
            case .success(let data):
                guard let _data = data else {return}
                self?.viewController?.getCharacterDetails(data: _data)
            case .failure:
                let error = AvengersErrorHandler.shared.handlerError(reponse: response)
                self?.viewController?.displayError(message: error.status)
            }
        })
    }
}
