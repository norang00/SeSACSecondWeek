//
//  YellowViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        print(#function)
        navigationController?.popViewController(animated: true)
        // 이전 화면으로 돌아간다
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        print(#function)
        dismiss(animated: true)
        // 이 뷰는 옆에서 온거지 아래에서 올라온 게 아니라 실행되지 않는다.
    }
    
}
