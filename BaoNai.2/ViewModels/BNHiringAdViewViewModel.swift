//
//  AdViewViewModel.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/20/23.
//

import UIKit

final class BNHiringAdViewViewModel: NSObject {
    
    func fetchAds() {
        BNService.shared.execute(.listAdRequest, expecting: BNGetAllAdsResponse.self) { result in
            switch result {
            case .success(let model):
                //print("Total: "+String(model.info.count))
                print("Page result count: "+String(model.data.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
extension BNHiringAdViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BNHiringCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? BNHiringCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = BNHiringCollectionViewCellViewModel(bname: "Nail Spa", bcity: "(" + "College Station" + ",", bstate: .tx , distance:  "3"   )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt index: IndexPath)-> CGSize {
        //let bounds = UIScreen.main.bounds
        //let width = (bounds.width-15)
        let width = 376
        let height = 198
        return CGSize(
            width: width, height: height
        )
    }
}
