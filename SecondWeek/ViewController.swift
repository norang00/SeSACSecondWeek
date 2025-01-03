//
//  ViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 12/30/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var kingfisherImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let url = URL(string: "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F109%2F2022%2F07%2F29%2F0004667693_001_20220729081704114.jpeg&type=sc960_832") {
            kingfisherImageView.kf.setImage(with: url)
        } else {
            kingfisherImageView.image = UIImage(systemName: "star")
        }
            
        
        print("resultLabel \(resultLabel.isUserInteractionEnabled)")
        resultLabel.isUserInteractionEnabled = true
        print("resultLabel \(resultLabel.isUserInteractionEnabled)")
        
    }

    // Did End On Exit -> 이 키워드 자체가 키보드 내려주는 기능 포함!
    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        // 예외처리를 이제부터 습관적으로 잘 생각해줍시다.
        // 작성한 문자열이 없을 때 -> count 로 세어준다.
        // 공백 제거가 필요할 때 -> whitespace 없애준다.
        // 대소문자 구분이 필요할 때 -> 여기서 내가 임의대로 다 대문자로 바꿔서 받을 수 있다. -> 오 훨씬 간단!
        let text = wordTextField.text!
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                    .uppercased()
        
        if text.count == 0 {
            resultLabel.text = "검색어를 작성해주세요"
        } else if text == "JMT" {
            resultLabel.text = "존맛탱"
        } else {
            resultLabel.text = "\(text)로 입력했어요"
        }
    }
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        print(#function)
    }
    
    func aboutOptional() {
        var nickname: String? = "고래밥"
        var age: Int? = 22
        
        // 1. 조건문을 통해 옵셔널 언래핑
        if nickname ==  nil { // == != 둘다 써도 되겠지
            print("닉네임 nil")
        } else {
            print("\(nickname!)으로 설정") // 조건 많아지면 이거 느낌표 계속 쓸거임?
        }

        if nickname != nil {
            print("\(nickname)으로 설정")
        } else {
            print("닉네임 nil")
        }

        // 2. 옵셔널 바인딩: if let / guard
        // 옵셔널타입이 아닌 타입으로 바꿔서 새로운 변수에 할당해 줌.
        // 해당 블록 안에서는 계속 언래핑 추가로 할 필요가 없다. 보통 같은 이름을 계속 씀.
        if let nickname = nickname {
            print("\(nickname)으로 설정")
        } else {
            print("닉네임 nil")
        }
        
        // if let shorthand
        if let age {
            print("나이는 \(age)")
        } else {
            print("닐닐닐닐닐닐")
        }
        print(type(of: age)) // ->Int? age 다시 옵셔널타입됨

        // guard let 구문: 언래핑 안되었을 때만
        // -> 무조건 프린트 찍으래요!
        guard let age else {
            print("옵셔널 해제를 실패했어요. age가 nil임")
            
            // return 없어도 동작은 함. 근데 꼭 해주어야 한다.
            // 왜냐하면 코드를 끝내겠다. 라는 의미이기 때문. -> 여기서 끝내면 근데 어디로 가지??
            // guard 구문의 else 블럭에서는 꼭 return 을 해주어야 이후 코드,
            // 그러니까 nil 이 들어간 채로 이후 코드가 실행되는 것을 막아줄 수 있다.
            return
        }
        print(type(of: age)) // -> Int age 옵셔널 해제된 채로 쓸 수 있음!

        // 3. 삼항연산자
        print(nickname ?? "게스트") // nil 이면 대신 나타낼 기본 값을 별도로 지정
        
        // 4. 옵셔널 체이닝
        // 물음표의 역할.
        // 이거 nil 아니면 이후 코드(.count) 진행 할게
        // 이거 nil 이면 이후 코드(.count) 진행 안할게
        print(wordTextField.text?.count)
        
        if let text = wordTextField.text {
            print(text.count)
        }
        
    }
}

