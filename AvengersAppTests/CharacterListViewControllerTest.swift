//
//  CharacterListViewControllerTest.swift
//  AvengersAppTests
//
//  Created by Nguyen Toan on 26/05/2021.
//

import Foundation
import Quick
import Nimble
import Alamofire

@testable import AvengersApp

class CharacterListTest: QuickSpec {
    override func spec(){
        let viewController = CharacterListViewControllerProtocolMock()
        let request = AvengersAPIRequestMock()
        request.successWanted = true
        
        let presenter = CharacterListPresenter.init(viewController: viewController, request: request)
        
        context("viewDidLoad") {
            presenter.viewDidLoad()
            it("executes presenterViewDidLoad protocol") {
                expect(viewController.isViewDidLoad).to(equal(true))
            }
        }
        
        context("requestCharacterList") {
            presenter.requestCharacterList()

            it("starts Loading Indicator") {
                expect(viewController.isStartLoading).to(equal(true))
            }
            
            it("gets Character Details Test Data") {
                expect(viewController.data?.data.results.first?.id).to(equal(1011334))
            }
            
            it("stops Loading Indicator") {
                expect(viewController.isStopLoading).to(equal(true))
            }
        }
        
        context("requestCharacterList") {
            request.successWanted = false
            presenter.requestCharacterList()
            
            waitUntil(timeout: .seconds(5)) { done in
                
                it("display error message in case of failure") {
                    expect(viewController.errorMessage).to(equal(AvengersGeneralError.generateGeneralError().status))
                }
                
                done()
            }
        }
    }
}

// MARK: - Mock Protocol For Testing
private class CharacterListViewControllerProtocolMock: CharacterListViewControllerProtocol {
    var errorMessage = ""
    func displayError(message: String) {
        errorMessage = message
    }
    
    var data: CharacterListModel?
    func getCharacterList(list: CharacterListModel) {
        data = list
    }
    
    var isStartLoading = false
    func startLoading() {
        self.isStartLoading = true
    }
    
    var isStopLoading = false
    func stopLoading() {
        self.isStopLoading = true
    }
    
    var isViewDidLoad = false
    func presenterViewDidLoad() {
        isViewDidLoad = true
    }
}

// MARK: - Mock API Request For Testing
private class AvengersAPIRequestMock: AvengersAPIRequest {
    var successWanted = false

    override func getCharacterList(completiongHandler: @escaping (DataResponse<CharacterListModel?, AFError>) -> Void) {
        switch  successWanted {
        case true:
            let decoder = JSONDecoder()
            guard let testData = FileReaderHelper.shared.getStringFromFile(fileName: "CharacterListTestData", type: "txt"), let data = testData.data(using: String.Encoding.utf8), let characterListModel = try? decoder.decode(CharacterListModel.self, from: data) else {
                return completiongHandler(.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: TimeInterval(1), result: Result.failure(AFError.explicitlyCancelled)))
            }

            return completiongHandler(.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: TimeInterval(1), result: Result.success(characterListModel)))
            
        case false:
            return completiongHandler(.init(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: TimeInterval(1), result: Result.failure(AFError.explicitlyCancelled)))
        }
    }
}
