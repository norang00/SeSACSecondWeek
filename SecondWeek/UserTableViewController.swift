//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit

struct Friend {
    let name: String
    let message: String
    let profileImage: String
}

class UserTableViewController: UITableViewController {
    
    let friends: [Friend] = [
        Friend(name: "민지", message: "고래밥 냠냠", profileImage: "star"),
        Friend(name: "하니", message: "행복한 하루", profileImage: "pencil"),
        Friend(name: "다니엘", message: "배고프당", profileImage: "star.fill")
    ]

//    var name = ["고래밥", "칙촉", "카스타드"]
//    let message = ["고래밥 냠냠", "행복한 하루", "배고프당 카스타드 맛있겠다"]
//    let profile = ["star", "pencil", "star.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        // as! 를 통해 별도 정의한 swift 파일을 매칭 해주어야 한다
        // 커스텀 셀의 경우에는 indexPath도 넣어주어야 함
     
        cell.userImageView.image = UIImage(systemName: "\(friends[indexPath.row].profileImage)")
        cell.userNameLabel.text = friends[indexPath.row].name
        cell.userMessageLabel.text = "\(friends[indexPath.row].message)"
        
        cell.userNameLabel.font = .boldSystemFont(ofSize: 15)
        cell.userMessageLabel.font = .systemFont(ofSize: 15)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
