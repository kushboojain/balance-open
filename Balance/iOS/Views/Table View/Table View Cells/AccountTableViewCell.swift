//
//  AccountTableViewCell.swift
//  BalanceiOS
//
//  Created by Red Davis on 05/10/2017.
//  Copyright © 2017 Balanced Software, Inc. All rights reserved.
//

import UIKit


internal final class AccountTableViewCell: TableViewCell {
    // Static
    static let height: CGFloat = 50.0
    
    // Internal
    internal var account: Account? {
        didSet {
            self.reloadData()
        }
    }
    
    // Private
    
    // MARK: Initialization
    
    internal override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        // Text label
        self.textLabel?.textColor = UIColor.white
        self.textLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        
        // Detail label
        self.detailTextLabel?.textColor = UIColor.white
        self.detailTextLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: Data
    
    private func reloadData() {
        guard let unwrappedAccount = self.account else {
            return
        }
        
        self.backgroundColor = unwrappedAccount.institution?.displayColor
        
        // Text label
        let currency = Currency.crypto(shortName: unwrappedAccount.currency)
        self.textLabel?.text = amountToString(amount: unwrappedAccount.displayBalance, currency: currency)
        
        // Detail label
        self.detailTextLabel?.text = "TODO: $100.00"
    }
}