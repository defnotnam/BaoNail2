//
//  BNHiringCollectionViewCell.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/21/23.
//

import UIKit

/// Single cell for a ad
final class BNHiringCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "BNHiringCollectionViewCell"
    
    //    private let imageView: UIImageView = {
    //        let imageView = UIImageView()
    //        imageView.contentMode = .scaleAspectFit
    //        imageView.translatesAutoresizingMaskIntoConstraints = false
    //        return imageView
    //    }
    
    private let spaLabel: UILabel = {
        
        var label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Inter-Bold", size: 12)            // Line height: 16 pt
        return label
    }()
    
    private let cityLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let stateLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let distanceLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor  = UIColor(red: 0.92, green: 0.95, blue: 0.78, alpha: 1)
        contentView.addSubviews(spaLabel, cityLabel, stateLabel, distanceLabel)
        addConstraints()
        //setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spaLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            spaLabel.rightAnchor.constraint(equalTo: cityLabel.leftAnchor, constant: -5),
            spaLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            
            cityLabel.leftAnchor.constraint(equalTo: spaLabel.rightAnchor, constant: 5),
            cityLabel.rightAnchor.constraint(equalTo: stateLabel.leftAnchor),
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            
            stateLabel.leftAnchor.constraint(equalTo: cityLabel.rightAnchor) ,
            stateLabel.rightAnchor.constraint(equalTo: distanceLabel.leftAnchor),
            stateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            distanceLabel.leftAnchor.constraint(equalTo: stateLabel.rightAnchor, constant: 5),
            distanceLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            
            spaLabel.widthAnchor.constraint(equalToConstant: 57),
            spaLabel.heightAnchor.constraint(equalToConstant: 28),
            cityLabel.widthAnchor.constraint(equalToConstant: 109),
            cityLabel.heightAnchor.constraint(equalToConstant: 28),
            stateLabel.widthAnchor.constraint(equalToConstant: 38),
            stateLabel.heightAnchor.constraint(equalToConstant: 28),
            distanceLabel.widthAnchor.constraint(equalToConstant: 61),
            distanceLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        spaLabel.backgroundColor = .systemGreen
        cityLabel.backgroundColor = .blue
        stateLabel.backgroundColor = .systemCyan
        distanceLabel.backgroundColor = .red
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        spaLabel.text = nil
        cityLabel.text = nil
        stateLabel.text = nil
        distanceLabel.text = nil
    }
    
    public func configure(with viewModel: BNHiringCollectionViewCellViewModel) {
        spaLabel.text = viewModel.bname
        cityLabel.text = viewModel.bcity
        stateLabel.text = viewModel.bstateText
        distanceLabel.text = viewModel.distance
//        viewModel.fetchImage { [weak self] result in
//            switch result {
//            case .success(let data):
//                DispatchQueue.main.async {
//                    let image = UIImage(data: data)
//                    self?.imageView.image = image
//                }
//            case .failure(let error):
//                print(String(describing: error))
//                break
//            }
        //}
    }
}
