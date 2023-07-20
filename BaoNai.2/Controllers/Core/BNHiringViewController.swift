//
//  BNHiringViewController.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/19/23.
//

import UIKit

/// Controller to show and search for Hiring Ads
final class BNHiringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Hiring"
        
        let request = BNRequest(endpoint: .ads)
        print(request.url)
        
        BNService.shared.execute(request, expecting: BNAd.self) { result in
            
        }
    }
}
