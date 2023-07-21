//
//  BNHiringViewController.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/19/23.
//

import UIKit

/// Controller to show and search for Hiring Ads
final class BNHiringViewController: UIViewController {

    private let hiringListView = BNHiringListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(hiringListView)
        NSLayoutConstraint.activate([
            hiringListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hiringListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            hiringListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            hiringListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])
    }
}
