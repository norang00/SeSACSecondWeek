//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit

class UserTableViewController: UITableViewController {

    var name = ["고래밥", "칙촉", "카스타드"] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        // as! 를 통해 별도 정의한 swift 파일을 매칭 해주어야 한다
        // 커스텀 셀의 경우에는 indexPath도 넣어주어야 함
     
        cell.userImageView.backgroundColor = .yellow
        cell.userNameLabel.text = name[indexPath.row]
        cell.userMessageLabel.text = "상태 메세지"
        
        cell.userNameLabel.font = .boldSystemFont(ofSize: 15)
        cell.userMessageLabel.font = .systemFont(ofSize: 15)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
