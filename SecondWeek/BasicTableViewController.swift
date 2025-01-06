//
//  BasicTableViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/2/25.
//

import UIKit

class BasicTableViewController: UITableViewController {
    // 원래는 Outlet 다 만들어주어야 하지만 지금은 일단 애플이 해둔거 쓰면 되어서 안해도 됨~
    
    var list: [String] = ["프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트", "메인 업무", "새싹 과제", "프로젝트", "메인 업무", "새싹 과제", "프로젝트", "메인 업무", "새싹 과제", "프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트", "메인 업무", "새싹 과제", "프로젝트", "메인 업무", "새싹 과제", "프로젝트프로젝트프로젝트", "메인 업무", "새싹 과제"] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        tableView.rowHeight = UITableView.automaticDimension
        
        
        
        //let monster = Monster() // 초기화 한다 = 인스턴스를 생성했다
        
        // 테이블뷰 선택이 가능하도록 하는 옵션! 클릭 가능 여부를 조절 할 수 있다.
        // 디폴트 true 라서 안 적어도 되긴 함.
//        tableView.allowsSelection = true
    }
    
    @IBAction func randomTextTapped(_ sender: UIBarButtonItem) {
        // 랜덤 텍스트 추가하기
        let randomList: [String] = ["고래밥", "칙촉", "다이제", "포카칩", "프링글스"]
        list.append("\(randomList.randomElement()!)")
        print("\(list.description)")
        
        // 테이블 아래에 추가하기 (데이터 갱신하기!!) -> 뷰와 데이터는 따로 논다, 잘 맞춰주세요.
        tableView.reloadData()
        // tableView 관련된 메서드들을 하나하나 다 불러주어야 하는데, reloadData 로 한번에 해주는거
        print(#function)
    }
    
    // 1. 셀의 갯수 : numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function, section)
        return list.count
    }
    
    // 2. 셀 디자인 및 데이터 처리 : cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "norangCell")!
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = .systemFont(ofSize: 18)
        // textLabel? detailTextLabel?
        // 스타일마다 요소가 다르기 때문에 없을 수도 있다! 는 것을 가정으로 두고 옵셔널 타입으로 둔다.
        
        // 어차피 해당 indexPath.row 마다 실행되는 코드로 자체적으로 반복문의 역할을 하고 있기 때문에,
        // 아래 한 줄만 적어주어도 리스트의 인덱스를 가져와서 타이틀을 추가하는 원하는 동작을 할 수 있다!!!
        cell.textLabel?.text = list[indexPath.row]
        cell.detailTextLabel?.setPrimaryLabel("extension test")
        //        let colors: [UIColor] = [.red, .green, .blue, .yellow]
        //        cell.textLabel?.textColor = colors.randomElement()
        //        cell.textLabel?.font = .systemFont(ofSize: 12)
        
//        if indexPath.row%2 == 0 {
//            cell.backgroundColor = .systemYellow
//        }
        
        if indexPath.row <= 3 {
            cell.backgroundColor = .systemYellow
        } else {
            // 셀 디자인 할때 default 값을 지정해주지 않으면 이상하게 처리된다!
            // 모든 셀에 대해 지정할 디자인을 정해주어야 한다.
            cell.backgroundColor = .yellow
        }
                
        print(#function, indexPath)
        
        return cell
    }
    
    // 3. 셀의 높이 : heightForRowAt
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        print(#function, indexPath)
    //        return 80
    //    }
    // 섹션마다, 혹은 셀마다 높이가 다르게 존재할 수 있는 가능성이 있어서, 얘도 계속계속 호출해준다.
    // 근데? 모든 셀들이 높이가 다 똑같애서 얘를 굳이 맨날 부를 필요가 없다?
    // 그러면 이제 이 부분은 지워버리고, viewDidLoad() 안에서 tableView.rowHeight = 80 지정해두면 프로퍼티로 고정시켜줄 수 있다.
    // 실질적으로 1번이랑 2번이 무조건 있어야 한다. 얘는 없어도 되긴 됨.

    // 셀을 클릭했을 때 지우기 -> 데이터를 변경하고, 리로드하기!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        list.remove(at: indexPath.row)
        tableView.reloadData()
        
        print(#function, indexPath)
    }
}
