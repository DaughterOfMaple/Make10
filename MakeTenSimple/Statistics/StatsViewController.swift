//
//  StatsViewController.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 31/5/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet var topShadowView: UIView!
  @IBOutlet var bottomShadowView: UIView!
  
  @IBOutlet weak var fds: UIView!
  fileprivate let statCategories = ["Best Time:", "Best Streak (<5m):", "Best Time Challenge Score:", "Total games played:", "Total games completed:", "Average attempts to complete:"]
  
  fileprivate let statsImage = ["flame", "flame", "flame", "clock", "clock", "pencil"]
  
  fileprivate var stats: [String] = ["10s", "6 games", "10 games", "155 games", "148 games", "1 attempt(s)"]
  
  fileprivate let sections = ["My stats", "Recent games"]
  fileprivate let numberOfGames = 10
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    let viewBackground = Gradient(superView: view)
    viewBackground.add(to: view)
  }
}

//MARK: - StatsViewController Delegate Methods
extension StatsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
    cell.layer.cornerRadius = 0
    
    if indexPath.row == 0 {
      cell.layer.cornerRadius = 15
      cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    if indexPath.section == 0 && indexPath.row == statCategories.count - 1 {
      cell.layer.cornerRadius = 15
      cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    if indexPath.section == 1 && indexPath.row == numberOfGames - 1 {
      cell.layer.cornerRadius = 15
      cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 60
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if (scrollView.contentOffset.y == 0) {
      topShadowView.alpha = 0
    }
  }
}

//MARK: - StatsViewController DataSource Methods
extension StatsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return statCategories.count
    }
    else {
      return numberOfGames
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
    
    cell.labelLeft.text = ""
    cell.labelRight.text = ""
    
    if indexPath.section == 0 {
      cell.labelLeft.text = statCategories[indexPath.row]
      cell.labelRight.text = stats[indexPath.row]
      cell.randomIdentifier.image = UIImage(systemName: statsImage[indexPath.row])
    }
    if indexPath.section == 1 {
      cell.labelLeft.text = "1 2 3 4"
      cell.labelRight.text = "2h 1m 56.6s"
    }
    
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let sectionHeader = StatsTableHeader()
    sectionHeader.tintColor = K.BrandColors.sectionHeader
    let titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: tableView.frame.size.width, height: 50))
    
    sectionHeader.addSubview(titleLabel)
    titleLabel.attributedText = NSAttributedString(
      string: sections[section],
      attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .light),
                   NSAttributedString.Key.foregroundColor : UIColor.white,
                   NSAttributedString.Key.backgroundColor : UIColor.clear])
    return sectionHeader
  }
}
