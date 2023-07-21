//
//  CharacterListView.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/20/23.
//import UIKit

//protocol BNHiringListViewDelegate: AnyObject {
//    func rmCharacterListView(
//        _ HiringListView: BNHiringListView,
//        didSelectCharacter character: h
//    )
//}
import UIKit

/// View that handles showing list of characters, loader, etc.
final class BNHiringListView: UIView {

    //public weak var delegate: BNHiringListViewDelegate?

    private let viewModel = BNHiringAdViewViewModel()

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 7.5, bottom: 12, right: 7.5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        //collectionView.register(RMFooterLoadingCollectionReusableView.self,
                               // forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                               // withReuseIdentifier: RMFooterLoadingCollectionReusableView.identifier)
        return collectionView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView, spinner)
        addConstraints()
        spinner.startAnimating()
       // viewModel.delegate = self
        viewModel.fetchAds()
        setUpCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            
            self.collectionView.isHidden = false
            
            UIView.animate(withDuration: 0.4, animations: {
                self.collectionView.alpha = 1
            })
        })
    }
}

extension BNHiringListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}
    
//    func didSelectCharacter(_ character: RMCharacter) {
//        delegate?.rmCharacterListView(self, didSelectCharacter: character)
//    }
//
//    func didLoadInitialCharacters() {
//        spinner.stopAnimating()
//        collectionView.isHidden = false
//        collectionView.reloadData() // Initial fetch
//        UIView.animate(withDuration: 0.4) {
//            self.collectionView.alpha = 1
//        }
//    }
//
//    func didLoadMoreCharacters(with newIndexPaths: [IndexPath]) {
//
//        collectionView.performBatchUpdates {
//            self.collectionView.insertItems(at: newIndexPaths)
//        }
//    }
//}
