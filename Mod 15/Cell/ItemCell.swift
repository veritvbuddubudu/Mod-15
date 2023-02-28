//
//  ItemCell.swift
//  Mod 15
//
//  Created by Елена Горбунова on 24.02.2023.
//

import UIKit
import SnapKit

class ItemCell: UITableViewCell {
    
    private lazy var image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var labelHeader: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var labelTime: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(named: "BDBDBD")
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter", size: 14)
        label.adjustsFontSizeToFitWidth = false
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var separatorLine: UIImageView = {
        let image = UIImageView(image: UIImage(named: "dividerLine"))
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        contentView.addSubview(labelHeader)
        contentView.addSubview(labelTime)
        contentView.addSubview(labelDescription)
        contentView.addSubview(separatorLine)
        
        initImage()
        initHeader()
        initTime()
        initDescription()
        initSeparatorLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ viewModel: ItemCellModel) {
        image.image = viewModel.image
        labelHeader.text = viewModel.header
        labelTime.text = viewModel.time
        labelDescription.text = viewModel.description
    }
    
    private func initImage() {
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
    
    private func initHeader() {
        labelHeader.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.leading.equalTo(image.snp.trailing).inset(-16)
        }
    }
    
    private func initTime() {
        labelTime.snp.makeConstraints { make in
            make.bottom.equalTo(labelHeader.snp.bottom)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
    }
    
    private func initDescription() {
        labelDescription.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.top.equalTo(labelHeader.snp.bottom).offset(8)
            
        }
    }
    
    private func initSeparatorLine() {
        separatorLine.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.top.equalTo(labelDescription.snp.bottom).offset(16)
        }
    }
}
