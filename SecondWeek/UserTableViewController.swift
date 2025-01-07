//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit

class UserTableViewController: UITableViewController {
        
    var friends = FriendsInfo().list

    override func viewDidLoad() {
        super.viewDidLoad()

//        // XIB Cell 을 추가
//        // nibName : 파일명
//        // bundle : ...? 옵셔널이니까 일단 nil
//        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
//        // XIB 로 별도로 만든 Cell 은 아직 모르니까 테이블뷰에 알려주어야 한다 (register)
//        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
//        // -> 해당 화면이 뜨기 전에 내가 쓸 셀 알려주기
    }
    
    // @objc 가 붙어있어야 #selector 에서 호출 했을 때 응답할 수 있다.
    @objc func likeButtonTapped(_ sender: UIButton) {
        friends[sender.tag].like.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let cell = UserTableViewCell()
        // UserTableViewCell 의 인스턴스를 만드는 작업이라고 생각할 수 있음
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell", for: indexPath) as! NoProfileTableViewCell
        
        let row = friends[indexPath.row]

        // 여기 cell 에서 메서드를 부르는 것은 가독성을 위한 것이다.
        // cell 에서 일어나는 일들을 tableView 는 이미 다 알고 있다.
        // 이미 연결고리가 다 되어 있음 그래서 제약을 주고 싶다하면 접근제어자를 사용하면 된다.
        cell.configureData(row)

        cell.likeButton.tag = indexPath.row
        // IBAction 대신 코드로 연결한다
        // Function Types 관련된 문법으로, 함수 호출 괄호()가 불필요
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        // target: 주로 self
        // action: 실행할 메서드 (Selector 라는건 Obj-C 의 잔재...)
        // for: 조작
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        // 1. 스토리보드 특정
        let storyboard = UIStoryboard(name: "User", bundle: nil)
        // Bundle 이 뜻하는 것은? 해당 폴더 하위가 다 번들임.
        // 내가 가지고 있는 파일 말고 Kingfisher 등 패키지를 쓸 때 사용한다. nil 로 두면 "내거 쓸거야" 하는 것이다

        // 2. 전환할 뷰컨트롤러 가져오기 (TealViewController)
        // let vc = TealViewController() -> 코드베이스로 쓸 때는 이렇게 씀
        let vc = storyboard.instantiateViewController(withIdentifier: "TealViewController") as! TealViewController
        
        // 3. 화면을 전환할 방법 선택하기 - 아래에서 위로 / modal / present
        present(vc, animated: true)
        
        // 4. selected 상태가 남아있을테니 다시 로드 하면서 해지해줌
        tableView.reloadRows(at: [indexPath], with: .automatic)

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
