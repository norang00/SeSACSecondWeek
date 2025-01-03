//
//  NumberViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 12/30/24.
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    @IBOutlet var randomIntLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view.backgroundColor = .yellow
        setViewBackgroundColor()
        
        dateLabel.text = getToday()
        randomIntLabel.text = getRandomInt().description
        
        // UserDefaults에 저장되어 있는 데이터를 불러오기
        let result = UserDefaults.standard.string(forKey: "number") // 가지고 오려는 타입으로 부르는군
        numberTextField.text = result
    }
    
    func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yy년MM월dd일"
        let today = format.string(from: Date())
        return today
    }
    
    // 코드 한 줄밖에 없어서 여기에는 return 생략해도 동작함
    // Swift5.1+ Implicit returns
    func getRandomInt() -> Int { Int.random(in: 1...100) }
    
    // 반환값 있어도 안쓸때도 있잖아요 그럴때는 @discardableResult 붙여주면 된다.
    // @ 붙어있는건 Swift Attributes 라고 부른다. 크게 세파트 있음.
    @discardableResult
    func test() -> Int {
        print("test")
        return 1
    }
    
    @IBAction func textFieldTextChanged(_ sender: UITextField) {
    // Event: Editing Changed

        // 실시간으로 레이블에 내용 반영
        // 입력한 내용이 숫자라면 숫자 그대로 출력
        // 입력한 내용이 문자라면 숫자가 아닙니다 출력

//        if let number = Int(numberTextField.text!) {
//            resultLabel.text = "\(number)"
//        } else {
//            resultLabel.text = "숫자가 아닙니다."
//        }
        
        // UITextField의 Text를 변환해주기 Optional<String> -> String
        guard let text = numberTextField.text else {
            print("Optional Error")
            return
        }

        // 형변환을 이용해서 확인해볼 수 있다. 형변환이 정상적으로 이루어지지 않으면 nil 이 반환
        print(Int(text))
        
        // 형변환이 정상 작동하는지에 따라 조건문을 적어볼 수 있다.
//        if Int(text) != nil {
//            // 형변환 한 시점에서 다시 옵셔널 타입이 되기 때문에 언래핑 한번 더 해야 한다.
//            print("형변환 무사 완료! \(Int(text)!)")
//        } else {
//            print("윽, 형변환 실패...")
//        }
        
//        if let number = Int(text) {
//            resultLabel.text = "\(number)"
//        } else {
//            resultLabel.text = "숫자가 아닙니다."
//        }
        
        guard let number = Int(text) else {
            resultLabel.text = "숫자가 아닙니다."
            return
        }
        // guard let 으로 쓰면 이 아래에도 언래핑한 number 상수를 쓸 수 있다.
        resultLabel.text = "\(number)"
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // 텍스트 필드에 적었던 내용을 영구적으로 저장. (앱을 껏다 키더라도 볼 수 있게!) 같은 키로 하면 덮어써서 수정된다
        UserDefaults.standard.set(numberTextField.text, forKey: "number")
        
        // 성공적으로 저장이 되었다는 알림(Alert)을 주기.
        // 1. 타이틀과 메세지를 남겨주기
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .alert
        )
        
        // 2. 버튼을 만들기
        let defaultAction1 = UIAlertAction(title: "확인1", style: .default)
        let defaultAction2 = UIAlertAction(title: "확인2", style: .default)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let destructiveAction = UIAlertAction(title: "삭제", style: .destructive)

        // 3. 본문에 버튼을 추가하기 (순서대로 추가된다)
        alert.addAction(defaultAction1)
        alert.addAction(defaultAction2)
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)

        // 4. 화면에 띄우기
        present(alert, animated: true)
        // UIViewController 를 넣어야 하는데 alert 도 UIViewController 를 상속하고 있기 때문에 넣어줄 수 있다.
    }
    
    @IBAction func showSavedData(_ sender: UIButton) {
        print(#function)
        resultLabel.text = UserDefaults.standard.string(forKey: "number")
    }
    
    
    @IBAction func deleteData(_ sender: UIButton) {
        print(#function)
        UserDefaults.standard.removeObject(forKey: "number")
    }
    
}

