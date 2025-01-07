//
//  UIColor+Extension.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/6/25.
//

import UIKit

extension UIColor {
    
    // 초기화 해서 인스턴스를 만들어야 확장을 할 수 있다.
    // 저장 프로퍼티, 인스턴스 프로퍼티 -> extension 내부에 저장 프로퍼티를 선언 할 수는 없다.
//    var storedColor = UIColor.yellow

    // 지연 저장도 안됨! 얘도 결국 저장 프로퍼티임.
//    lazy var storedColor = UIColor.yellow

    // 저장 프로퍼티, 타입 프로퍼티 -> 인스턴스와 상관없이 메모리에 저장되기 때문에 사용 가능
    static var staticColor = UIColor.red
    
    // 연산 프로퍼티, 인스턴스 프로퍼티 -> 기존 저장 프로퍼티를 통해서 내보내는 것이기 때문에 사용 가능
    var norangColor: UIColor {
        return UIColor.systemYellow
    }

    // 연산 프로퍼티, 타입 프로퍼티 -> 당연 가능
    static var norang2Color: UIColor {
        return UIColor.systemYellow
    }

}
