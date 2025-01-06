//
//  UserTableViewCell.swift
//  SecondWeek
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit
import Kingfisher
// 라이브러리마다 다르다. 한 군데만 import 해도 모든 파일에서 사용 가능할 수도 있다.
// 그래도 쓰는 파일에 명시적으로 남겨주자!

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"

    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var userMessageLabel: UILabel!
 
    // 한번 지정하고 안바뀌는 속성들은 여기에 넣어준다.
    // 배경색이라든지, 폰트크기나 굵기라든지.
    // 셀마다 같은 속성을 계속 부를 필요 없도록
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        // 모든 셀에서 정확히 같은 내용
        configure()
    }
    
    // 셀을 재사용하려고 할 때 한번씩 호출해주기 때문에, 여기 기본값 등등 넣어주면 너무 좋다/
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function)
        userImageView.image = UIImage(systemName: "star")
    }
    
    private func configure() {
        userImageView.image = UIImage(systemName: "star")
        userImageView.contentMode = .scaleAspectFill
        userNameLabel.font = .boldSystemFont(ofSize: 18)
        userMessageLabel.font = .systemFont(ofSize: 15)
        userMessageLabel.numberOfLines = 0
    }
    
    // 해당 Cell 의 UI 속성을 여기서 지정해준다.
    // 각 파일의 역할에 대해 생각해보면 좋다. 버튼을 클릭하는 기능! 이런걸 Cell 이 할 필요가 있을까?
    func configureData(_ row: Friends) {
        likeButton.setImage(UIImage(systemName: row.like ? "heart.fill":"heart"), for: .normal)
  
        if let image = row.profile_image {
            let imageURL = URL(string: image)
            userImageView.kf.setImage(with: imageURL)
            
        }
//        else {
//            //기본 이미지
//            userImageView.image = UIImage(systemName: "star")
//        }
        
        userNameLabel.text = row.nameDescription
        userMessageLabel.text = row.message
        
        
        print(#function)

    }
    
}
