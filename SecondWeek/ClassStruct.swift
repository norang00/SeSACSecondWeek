//
//  ClassStruct.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/2/25.
//

import Foundation

// 1. 가지고 있는 프로퍼티에 모두 초기값을 지정
// 2. 가지고 있는 프로퍼티를 옵셔널로 선언
class Monster {
    // 지금은 아래 프로퍼티들은 모두 초기값이 지정되어 있는 상태.
    // 하나라도 지정이 안되어 있다면 오류가 발생한다.
//    var clothes: String? = 0
//    let speed = 5
//    let power = 10
//    let experience = 100
    
    // 그때그때 몬스터마다 다른 값을 주어서 인스턴스를 생성하고 싶다고 한다면 아래와 같이!
    var clothes: String
    var speed: Int
    var power: Int
    var experience: Int

    init(clothes: String, speed: Int, power: Int, experience: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experience = experience
    }
    // (아래)와 같이 초기값을 지정해주는 함수를 만들 수 있다. (위의 건) 애플이 init() 을 통해 해주는 것
    // 위에거랑 동일한 기능이다.
    func initializer(a: String, b: Int, c: Int, d: Int) {
        self.clothes = a
        self.speed = b
        self.power = c
        self.experience = d
    }
}

class BossMonster: Monster {
    
}

class SuperMonster: BossMonster {
    
}


// 스트럭트는 모든 init() 이 없어도 디폴트로 제공해줌!
struct MonsterStruct {
    var clothes: String
    var speed: Int
    var power: Int
    var experience: Int

}

//
// init 이 없더라도 초기화해줌!
// 멤버 이니셜라이즈 구조체는 이걸 기본 제공 해줘서 좀 더 편하게 쓸 수 있다.
//
