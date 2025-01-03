//
//  UILabel+Extension.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/2/25.
//

import UIKit

extension UILabel {
    
    func setPrimaryLabel(_ text: String) {
        // 호출한 나 자신에 대해서 속성을 주고 싶을 때, self 를 쓴다.
        self.font = .boldSystemFont(ofSize: 14)
        self.textColor = .systemMint
        self.textAlignment = .center
        self.text = text
    }
    
}
