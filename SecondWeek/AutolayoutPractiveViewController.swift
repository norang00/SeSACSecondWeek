//
//  AutolayoutPractiveViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 12/31/24.
//

import UIKit

class AutolayoutPractiveViewController: UIViewController {

    let colorList: [UIColor] = [.red, .orange, .yellow, .green, .blue, .magenta, .purple, .cyan]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colorList.randomElement()!
        print(self, #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self, #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self, #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self, #function)
    }
    
    // 스토리보드에서 연결하는게 아니라, 코드로 직접 타이핑해서 쓴다.
    // 터널 .unwind
    // sender 를 세그웨이로 주면 이렇게 쓸 수 있구나 presentation 방식에 따라 화면전환 방향이 정해진다.
    // 원래는 해당 버튼이 있는 뷰컨트롤러에서 버튼 액션 정의를 적어주는데, 이건 돌아가고 싶은 화면에 정의한다.
    // 일단 예외적인 방식이라고 생각하면 편할듯함.
    @IBAction func unwindToPracticeViewController(_ sender: UIStoryboardSegue) {
        print(self, #function)
    }
}
