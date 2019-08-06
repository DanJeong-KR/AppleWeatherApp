//
//  SearchLocationViewController.swift
//  WeatherApp_KakaoPay
//
//  Created by Sicc on 06/08/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit
import MapKit

class SearchLocationViewController: UITableViewController {
  
  var matchingItems:[MKMapItem] = []
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  let searchController = UISearchController(searchResultsController: nil)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.1720331609, green: 0.1717363596, blue: 0.1722783148, alpha: 1)
    configureNavigationBar()
    configureSearchController()
    configureTableView()
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    searchController.searchBar.becomeFirstResponder()
  }
  
  private func configureTableView() {
    tableView.register(cell: UITableViewCell.self)
    tableView.separatorStyle = .none
    
  }
  
  private func configureNavigationBar() {
    navigationController?.navigationBar.barStyle = .black
    navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1720331609, green: 0.1717363596, blue: 0.1722783148, alpha: 1)
    navigationController?.navigationBar.isTranslucent = false
  }
  
  private func configureSearchController() {
    title = "도시, 우편번호 또는 공항 위치 입력"
    //Search Controller
    searchController.searchResultsUpdater = self
    searchController.delegate = self
    searchController.isActive = true
    searchController.hidesNavigationBarDuringPresentation = false
    searchController.obscuresBackgroundDuringPresentation = false
    
    //Search Bar
    searchController.searchBar.showsCancelButton = true
    searchController.searchBar.barStyle = .black
    searchController.searchBar.backgroundColor = #colorLiteral(red: 0.1720331609, green: 0.1717363596, blue: 0.1722783148, alpha: 1)
    navigationItem.searchController = searchController
    definesPresentationContext = true
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return matchingItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("haha")
    let selectItem = matchingItems[indexPath.row]
    print("\(selectItem.name!) : \(selectItem.placemark.coordinate)" )
    
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
      self.tableView.reloadData()
    }
  }
}

extension SearchLocationViewController: UISearchControllerDelegate {
  func didPresentSearchController(_ searchController: UISearchController) {
    // searcbh
    searchController.searchBar.becomeFirstResponder()
  }
}
