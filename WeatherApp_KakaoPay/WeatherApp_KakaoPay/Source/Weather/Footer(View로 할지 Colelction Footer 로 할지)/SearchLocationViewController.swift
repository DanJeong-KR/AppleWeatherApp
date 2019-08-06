//
//  SearchLocationViewController.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 06/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit
import MapKit

class SearchLocationViewController: UIViewController {
  
  // MARK: - Properties
  private lazy var searchView: UIView = {
    let v = UIView(frame: .zero)
    v.backgroundColor = .clear
    view.addSubview(v)
    return v
  }()
  
  private lazy var topLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "도시, 우편번호 또는 공항 위치 입력"
    lb.textColor = .white
    lb.backgroundColor = .clear
    lb.font = WeatherFont.description
    view.addSubview(lb)
    return lb
  }()
  
  private lazy var searchTableView: UITableView = {
    let tv = UITableView(frame: .zero)
    tv.dataSource = self
    tv.delegate = self
    tv.register(cell: UITableViewCell.self)
    tv.separatorStyle = .none
    tv.backgroundColor = .clear
    view.addSubview(tv)
    return tv
  }()
  
  
  var matchingItems:[MKMapItem] = []
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  let searchController = UISearchController(searchResultsController: nil)

  // MARK: - ViewController LifeCyle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = true
    view.backgroundColor = .clear
    configureSearchController()
    makeConstraints()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    searchController.searchBar.becomeFirstResponder()
  }
  
  private func makeConstraints() {
    topLabel.layout.centerX().top().height(constant: 50)
    searchView.layout.top(equalTo: topLabel.bottomAnchor).leading().trailing().height(constant: 60)
    searchTableView.layout.top(equalTo: searchView.bottomAnchor).leading().trailing().bottom()
  }
  
  private func configureNavigationBar() {
    title = "도시, 우편번호 또는 공항 위치 입력"
    navigationController?.navigationBar.barStyle = .black
    navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1720331609, green: 0.1717363596, blue: 0.1722783148, alpha: 1)
    navigationController?.navigationBar.isTranslucent = false
  }
  
  private func configureSearchController() {
    //Search Controller
    searchController.searchResultsUpdater = self
    searchController.delegate = self
    searchController.isActive = true
    searchController.hidesNavigationBarDuringPresentation = false
    searchController.obscuresBackgroundDuringPresentation = false
    
    //Search Bar
    searchController.searchBar.delegate = self
    searchController.searchBar.showsCancelButton = true
    searchController.searchBar.barStyle = .black
    searchController.searchBar.backgroundColor = .clear
    //navigationItem.searchController = searchController
    self.searchView.addSubview(searchController.searchBar)
    definesPresentationContext = true
  }
  
  
}

extension SearchLocationViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return matchingItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(UITableViewCell.self)
    let selectedItem = matchingItems[indexPath.row].placemark
    
    let locality = selectedItem.locality ?? "" //  중구
    let subLocality = selectedItem.subLocality ?? "" // 신당동
    let thoroughfare = selectedItem.thoroughfare ?? "" // 남산대로 / subLocality 로 나타나지 않는 것들이 thoroughfare 속성으로 들어온다.
    let address = locality + " " + (!subLocality.isEmpty ? subLocality : thoroughfare)
    cell.textLabel?.text = address
    cell.backgroundColor = #colorLiteral(red: 0.1720331609, green: 0.1717363596, blue: 0.1722783148, alpha: 1)
    cell.textLabel?.textColor = .white
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectItem = matchingItems[indexPath.row].placemark
    self.dismiss(animated: false) { // SearchController dismiss 먼저
      self.dismiss(animated: true, completion: { // self dismiss
        DataManager.shared.fetchWeather(from: selectItem.coordinate,
                                        with: selectItem.locality ?? "",
                                        completionHandler: {
                                          print("haha :",self.presentingViewController)
        })
        
        
        
        
      })
    }
  }
}

extension SearchLocationViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let searchBarText = searchController.searchBar.text else { return }
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = searchBarText
    let search = MKLocalSearch(request: request)
    search.start {
      (response, _) in
      guard let response = response else { return }
      self.matchingItems = response.mapItems
      self.searchTableView.reloadData()
    }
  }
}

extension SearchLocationViewController: UISearchControllerDelegate {
  func didPresentSearchController(_ searchController: UISearchController) {
    // searcbh
  }
}

extension SearchLocationViewController: UISearchBarDelegate {
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    self.dismiss(animated: true, completion: nil)
  }
}
