//
//  ModalViewController.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 12/31/24.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    let colorList: [UIColor] = [.orange, .yellow, .green, .blue, .cyan, .black]

    override func viewDidLoad() {
        super.viewDidLoad()
        
// view.backgroundColor = colorList[0]
        setViewBackgroundColor()
        
        label.text = #function
        print(self, #function)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = colorList[1]

        label.text = #function
        print(self, #function)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        view.backgroundColor = colorList[5]

        label.text = #function
        print(self, #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        view.backgroundColor = colorList[2]

        label.text = #function
        print(self, #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
   
        view.backgroundColor = colorList[3]

        label.text = #function
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        view.backgroundColor = colorList[4]

        label.text = #function
        print(self, #function)
    }
        
}
