//
//  BnHiringCollectionViewCellModel.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/21/23.
//

import Foundation

final class BNHiringCollectionViewCellViewModel {
    public let bname: String
    public let bstate: Bstate
    public let bcity: String
    public let distance: String
    
     //MARK: - Init
    init(
        bname: String,
        bcity: String,
        bstate: Bstate,
        distance: String
    ) {
        self.bname = bname
        self.bstate = bstate
        self.bcity = bcity
        self.distance = distance
    }
    
    public var bstateText: String {
        return bstate.rawValue
        
    }
    
//    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void)
//    {
//        guard let url = hiringImageUrl else {
//            completion(.failure(Swift.error))
//        }
//    }
}
