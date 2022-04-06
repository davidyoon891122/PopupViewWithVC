//
//  PopupView.swift
//  PopUpView
//
//  Created by iMac on 2022/04/06.
//

import Foundation
import UIKit
import SnapKit

class PopupView: UIViewController {
    
    private lazy var displayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "긴급 점검 안내"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.text = """
            서버 점검 안내 입니다.
            점검일: 2022년 5월 25일
            시간: 15:30 ~ 18:00 (예정)
            내용:
            주요 업데이트 반영
            서버 변경사항 관련 테스트 진행 및
            업데이트 반영
        """
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGesture()
    }
}

private extension PopupView {
    func setupView() {
        view.backgroundColor = .black
        view.alpha = 0.6
        view.addSubview(displayView)
        
        displayView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(200.0)
            $0.height.equalTo(300.0)
        }
        [titleLabel, contentsLabel]
            .forEach {
                displayView.addSubview($0)
            }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(16.0)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32.0)
            $0.leading.equalToSuperview().offset(8.0)
            $0.trailing.equalToSuperview().offset(-8.0)
        }
    }
    
    func setupGesture() {
        let tapViewGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        view.addGestureRecognizer(tapViewGesture)
    }
    
    @objc func dismissView() {
        dismiss(animated: false, completion: nil)
    }
}
