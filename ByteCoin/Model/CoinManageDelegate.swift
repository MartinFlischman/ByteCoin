//
//  CoinManageDelegate.swift
//  ByteCoin
//
//  Created by Martin on 2024/08/21.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

protocol CoinManagerDelegate: AnyObject {
    func didUpdatePrice(price: Double)
    func didFailWithError(_ error: Error)
}
