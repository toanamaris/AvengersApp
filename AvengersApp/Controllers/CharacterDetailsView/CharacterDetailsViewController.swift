//
//  CharacterDetailsViewController.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import UIKit
import Kingfisher

class CharacterDetailsViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var id = ""
    var presenter: CharacterDetailsPresenter?
    var details: CharacterDetailsModel?
    var dataSource = Dictionary<String,Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CharacterDetailsPresenter(viewController: self)
        presenter?.id = id
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        iconImageView.layer.cornerRadius = iconImageView.bounds.height / 2
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    private func updateData(){
        guard let _details = self.details, let profile = _details.data.results.first else {return}
        let url = URL(string: "\(profile.thumbnail.path).\(profile.thumbnail.extension)")
        iconImageView.kf.setImage(with: url)
        nameLabel.text = profile.name
        dataSource = ["Comics" : profile.comics.available, "Series" : profile.series.available, "Stories" : profile.stories.available, "Events" : profile.events.available, "URLs" : profile.urls.count]
        tableView.reloadData()
    }
}

// MARK: - View Controller Protocol
extension CharacterDetailsViewController: CharacterDetailsViewControllerProtocol {
    func displayError(message: String) {
        MessageHelper.shared.displayMessage(theme: .error, title: "Error", message: message)
    }
    
    func presenterViewDidLoad() {
        setupUI()
        presenter?.getCharacterDetails()
    }
    
    func startLoading() {
        IndicatorHelper.shared.startLoading(type: .ballScaleMultiple, message: "Loading")
    }
    
    func stopLoading() {
        IndicatorHelper.shared.stopLoading()
    }
    
    func getCharacterDetails(data: CharacterDetailsModel) {
        self.details = data
        updateData()
    }
}

//MARK: - Table Delegate and Datasource
extension CharacterDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        switch indexPath.section {
        case 0:
            cell?.imageView?.image = UIImage(systemName: "book.circle")
            cell?.textLabel?.text = "Comics: \(dataSource["Comics"] ?? 0)"
        case 1:
            cell?.imageView?.image = UIImage(systemName: "tv.circle")
            cell?.textLabel?.text = "Series: \(dataSource["Series"] ?? 0)"
        case 2:
            cell?.imageView?.image = UIImage(systemName: "tag.circle")
            cell?.textLabel?.text = "Stories: \(dataSource["Stories"] ?? 0)"
        case 3:
            cell?.imageView?.image = UIImage(systemName: "tag.circle")
            cell?.textLabel?.text = "Events: \(dataSource["Events"] ?? 0)"
        case 4:
            cell?.imageView?.image = UIImage(systemName: "link.circle")
            cell?.textLabel?.text = "URLs: \(dataSource["URLs"] ?? 0)"
        default:
            break
        }
        return cell!
    }
}


