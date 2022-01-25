//
//  DebitAccount.swift
//  ComponentModule
//
//  Created by 60067670 on 2022/01/25.
//

import SwiftUI

class DebitAccount: ObservableObject {
	let accountName: String
	let accountNumber: String
	let currency: String
	@Published var ballance: String
	
	init(accountName: String, accountNumber: String, currency: String,ballance: String) {
		self.accountName = accountName
		self.accountNumber = accountNumber
		self.currency = currency
		self.ballance = ballance
	}
}

extension DebitAccount: Equatable {
	static func == (lhs: DebitAccount, rhs: DebitAccount) -> Bool {
		return lhs.accountNumber == rhs.accountNumber
	}
}


class DebitAccountStore: ObservableObject {
	@Published var list: [DebitAccount]
	
	init() {
		list = [
		]
	}
	
	func getAllAccounts() {
		list = [
			DebitAccount(accountName: "USD Online special Savings", accountNumber: "110-492-079472", currency: "USD", ballance: "7,897,018.00"),
			DebitAccount(accountName: "USD Online special Fund", accountNumber: "294-492-073272", currency: "USD", ballance: "6,318.00"),
			DebitAccount(accountName: "KHR Online special Fund", accountNumber: "611-492-073272", currency: "USD", ballance: "0.00"),
		]
	}
}
