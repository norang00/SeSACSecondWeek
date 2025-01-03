//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit
import Kingfisher

class UserTableViewController: UITableViewController {
    
    var friends = FriendsInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // @objc 가 붙어있어야 #selector 에서 호출 했을 때 응답할 수 있다.
    @objc func likeButtonTapped(_ sender: UIButton) {

        friends[sender.tag].like.toggle()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        // as! 를 통해 별도 정의한 swift 파일을 매칭 해주어야 한다
        // 커스텀 셀의 경우에는 indexPath도 넣어주어야 함
     
        let row = friends[indexPath.row]
        
        cell.likeButton.setImage(UIImage(systemName: row.like ? "heart.fill":"heart"), for: .normal)
        cell.likeButton.tag = indexPath.row
        
        // IBAction 대신 코드로 연결한다
        // Function Types 관련된 문법으로, 함수 호출에 괄호가 불필요
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        // target: 주로 self
        // action: 실행할 메서드 (Selector 라는건 Obj-C 의 잔재...)
        // for: 조작
        
        if let image = row.profile_image {
            let imageURL = URL(string: image)
            cell.userImageView.kf.setImage(with: imageURL)
        } else {
            //기본 이미지
            cell.userImageView.image = UIImage(systemName: "star")
        }
        cell.userNameLabel.text = row.name
        cell.userMessageLabel.text = row.message
        
        cell.userNameLabel.font = .boldSystemFont(ofSize: 15)
        cell.userMessageLabel.font = .systemFont(ofSize: 15)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
