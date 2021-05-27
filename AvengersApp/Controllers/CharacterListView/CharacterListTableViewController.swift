//
//  CharacterListTableViewController.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import UIKit

class CharacterListTableViewController: UITableViewController {
    
    var dataSource = [CharacterListDetails]()
    var presenter: CharacterListPresenter?
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CharacterListPresenter(viewController: self)
        presenter?.viewDidLoad()
    }
    
    private func setupUI(){
        self.view.backgroundColor = UIColor(named: "Avengers_red")
        tableView.register(UINib(nibName: "CharacterListCell", bundle: nil), forCellReuseIdentifier: "characterListCell")
        presenter?.requestCharacterList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterDetails" {
            let viewController = segue.destination as! CharacterDetailsViewController
            viewController.id = self.id
        }
    }
}

// MARK: - Table view data source
extension CharacterListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterListCell") as! CharacterListCell
        let item = dataSource[indexPath.section]
        
        cell.setUpCell(name: item.name, thumbnail: "\(item.thumbnail.path).\(item.thumbnail.extension)")
        cell.addAnimation(animationDirection: .left, delay: (indexPath.row + 4))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.id = String(dataSource[indexPath.section].id)
        performSegue(withIdentifier: "toCharacterDetails", sender: self)
    }
}

// MARK: - View Controller Protocol
extension CharacterListTableViewController: CharacterListViewControllerProtocol {
    func displayError(message: String) {
        MessageHelper.shared.displayMessage(theme: .error, title: "Error", message: message)
    }
    
    func startLoading() {
        IndicatorHelper.shared.startLoading(type: .ballClipRotateMultiple)
    }
    
    func stopLoading() {
        IndicatorHelper.shared.stopLoading()
    }
    
    func presenterViewDidLoad() {
        setupUI()
    }
    
    func getCharacterList(list: CharacterListModel) {
        dataSource = list.data.results
        self.tableView.reloadData()
    }
}
