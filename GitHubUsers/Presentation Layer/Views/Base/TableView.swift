//
//  TableView.swift
//  GitHubUsers
//
//  Created by dk on 27/02/2020.
//  Copyright © 2020 dk. All rights reserved.
//

import EasyPeasy
import RxCocoa
import RxDataSources
import RxSwift
import RxSwiftExt
import UIKit

typealias IsTableCellWithReuseID = HasReuseID & UITableViewCell

class TableViewModel: ViewModel, ViewModelDataSource {
    let elements = BehaviorRelay<[ViewModel]>(value: [])
    
    let modelSelected = PublishRelay<ViewModel>()
    
    let reachedBottom = PublishRelay<Void>()
}

class TableView<Model: TableViewModel>: View<Model> {
    let tableView = UITableView(frame: CGRect.zero, style: .plain)
    
    override func didLoad() {
        super.didLoad()
        
        tableView.backgroundColor = .clear
        
        addSubview(tableView, layout: Edges())
        
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    var canEditRowAtIndexPath: (IndexPath) -> Bool = { _ in
        true
    }
    
    override func setModel(_ viewModel: Model) {
        super.setModel(viewModel)
        
        UITableView.globalAssociation.forEach { tableView.register(cellClass: $0) }
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, ViewModel>>(configureCell: { (_, tableView, indexPath, model) -> UITableViewCell in
            
            let cellReuseIdentifier = String(describing: type(of: model))
            let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
            
            guard let Cell = cell as? HasAnyViewModel else { return cell }
            
            Cell.setAnyModel(model)
            return cell
        })
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            dataSource.sectionModels[index].model
        }
        
        dataSource.titleForFooterInSection = { dataSource, index in
            dataSource.sectionModels[index].model
        }
        
        dataSource.canEditRowAtIndexPath = { [weak self] _, b in
            self?.canEditRowAtIndexPath(b) ?? true
        }
        
        dataSource.canMoveRowAtIndexPath = { _, _ in
            true
        }
        
        tableView.rx.modelSelected(type(of: viewModel.elements.value).Element.self)
            .bind(to: viewModel.modelSelected)
            .disposed(by: disposeBag)
        
        viewModel.elements
            .map { [SectionModel<String, ViewModel>(model: "", items: $0)] }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx.reachedBottom()
            .bind(to: viewModel.reachedBottom)
            .disposed(by: disposeBag)
    }
}
