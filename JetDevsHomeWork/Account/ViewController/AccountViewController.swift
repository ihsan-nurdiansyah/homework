//
//  AccountViewController.swift
//  JetDevsHomeWork
//
//  Created by Gary.yao on 2021/10/29.
//

import UIKit
import Kingfisher

class AccountViewController: UIViewController {

	@IBOutlet weak var nonLoginView: UIView!
	@IBOutlet weak var loginView: UIView!
	@IBOutlet weak var daysLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var headImageView: UIImageView!
	override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationController?.navigationBar.isHidden = true
    }
	
	@IBAction func loginButtonTap(_ sender: UIButton) {
        let destinationVC = LoginVC(nibName: "LoginVC", bundle: nil)
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setData()
    }
    
    func setData() {
        if let userData = retrieveObject() {
            nameLabel.text = userData.userName
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: String(userData.createdAt.prefix(10))) {
                let daysAgo = timeAgo(from: date)
                daysLabel.text = "Created \(timeAgo(from: date))"
            }
            nonLoginView.isHidden = true
            loginView.isHidden = false
        } else {
            nonLoginView.isHidden = false
            loginView.isHidden = true
        }
        
    }
    
    func timeAgo(from date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month, .weekOfMonth, .day], from: date, to: now)
            
        if let years = components.year, years > 0 {
            return "\(years) years ago"
        } else if let months = components.month, months > 0 {
            return "\(months) months ago"
        } else if let weeks = components.weekOfMonth, weeks > 0 {
            return "\(weeks) weeks ago"
        } else if let days = components.day, days > 0 {
            return "\(days) days oge"
        } else {
            return "now"
        }
    }
	
}
