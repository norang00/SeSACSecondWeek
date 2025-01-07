//
//  TealViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

class TealViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        print(#function)
        dismiss(animated: true)
    }
    
    
}
