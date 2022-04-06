//
//  ViewController.swift
//  PopUpView
//
//  Created by iMac on 2022/04/06.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private var isPopped = false
    
    private lazy var popupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pop!", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12.0
        button.layer.masksToBounds = true
        button.addTarget(
            self,
            action: #selector(activatePopupView),
            for: .touchUpInside
        )
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !isPopped {
            setupPopupView()
            isPopped = !isPopped
        }
    }
    
}

private extension ViewController {
    func setupPopupView() {
        let popUpView = PopupView()
        popUpView.modalPresentationStyle = .fullScreen
        present(popUpView, animated: false, completion: nil)
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        [popupButton]
            .forEach {
                view.addSubview($0)
            }
        
        let inset: CGFloat = 16.0
        popupButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(inset)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(50.0)
        }
    }
    
    @objc func activatePopupView() {
        setupPopupView()
    }
}

