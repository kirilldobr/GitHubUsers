//
//  ErrorView.swift
//  GitHubUsers
//
//  Created by dk on 28/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import RxSwift
import UIKit

class ErrorView: View<ErrorViewModel> {
    let stackView = UIStackView()
    let titleLabel = UILabel()
    let button = UIButton()
    
    override func didLoad() {
        super.didLoad()
        
        addSubview(stackView, layout: Left(), Right(), CenterY())
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(button)
        stackView.axis = .vertical
        
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        button.setTitleColor(.blue, for: .normal)
        
        let titleLabelFont = UIFont.systemFont(ofSize: 16)
        titleLabel.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: titleLabelFont)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .black
    }
    
    override func setModel(_ viewModel: ErrorViewModel) {
        super.setModel(viewModel)
        
        viewModel.textTitle
            .observeOn(MainScheduler())
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.buttonTitle
            .observeOn(MainScheduler())
            .bind(to: button.rx.title(for: .normal))
            .disposed(by: disposeBag)
        
        button.rx.tap
            .bind(to: viewModel.buttonPressed)
            .disposed(by: disposeBag)
        
        viewModel.textTitle
            .map { $0?.isEmpty ?? true }
            .observeOn(MainScheduler())
            .bind(to: titleLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.isHidden
            .observeOn(MainScheduler())
            .bind(to: rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.buttonTitle
            .map { $0?.isEmpty ?? true }
            .observeOn(MainScheduler())
            .bind(to: button.rx.isHidden)
            .disposed(by: disposeBag)
    }
}
