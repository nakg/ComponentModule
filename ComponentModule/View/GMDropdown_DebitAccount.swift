//
//  GMDropdown_DebitAccount.swift
//  ComponentModule
//
//  Created by 60067670 on 2022/01/25.
//

import SwiftUI

public struct GMDropdown_DebitAccount: View {
	@EnvironmentObject var store: DebitAccountStore
	@State private var accountName: String = "" // 입력한 속성을 바인딩할 때 사용하는 속성 선언. 이런 속성들은 주로 @State로 선언.
	@State private var accountNumber: String = "" // 입력한 속성을 바인딩할 때 사용하는 속성 선언. 이런 속성들은 주로 @State로 선언.
	@State private var currency: String = "" // 입력한 속성을 바인딩할 때 사용하는 속성 선언. 이런 속성들은 주로 @State로 선언.
	@State private var balance: String = "" // 입력한 속성을 바인딩할 때 사용하는 속성 선언. 이런 속성들은 주로 @State로 선언.
	
	public init() {
		
	}
	
	public var body: some View {
		Button(action: {
			
		}, label: {
			VStack {
				LineView(height: .constant(1.0))
				Group {
					VStack (spacing: 4.0) {
						VStack(spacing: 7.0) {
							BankNameView(currency: $accountName)
							AccountView(account: $accountNumber)
						}
						VStack(spacing: 4.0) {
							AmountTitleView()
							AmountValueView(currency: $currency ,value: $balance)
						}
					}
				}
				.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
				LineView(height: .constant(5.0))
			}
		})
			.onAppear {
				self.store.getAllAccounts()
				self.accountName = self.store.list[0].accountName
				self.accountNumber = self.store.list[0].accountNumber
				self.balance = self.store.list[0].balance
			}
	}
}

// MARK: Line View
struct LineView: View {
	@Binding public var height:CGFloat
	var bottomTumbLineColor = Color(hex: 0xEBEFF5)
	var body: some View {
		Rectangle()
			.foregroundColor(bottomTumbLineColor)
			.frame(height: height)
	}
}

// MARK: 뱅크명
struct BankNameView: View {
	@Binding var currency: String
	let fontColor = Color(hex:0x21272A)
	let bgColor = Color(hex: 0x808892)

	var body: some View {
		HStack (spacing: 8){
			Text(currency)
				.foregroundColor(fontColor)
				.font(.system(size: 15))
			Spacer()
			Image("iconArrowDown").foregroundColor(bgColor)
		}
	}
}

// MARK: 계좌명
struct AccountView: View {
	@Binding var account:String
	let fontColor = Color(hex:0x21272A)
	
	var body: some View {
		Text(account)
			.frame(maxWidth: .infinity, alignment: .leading)
			.foregroundColor(fontColor)
			.font(.system(size: 15))
	}
}

// MARK: Amount Title
struct AmountTitleView: View {
	let fontColor = Color(hex:0x808892)
	
	var body: some View {
		Text("Available balance")
			.frame(maxWidth: .infinity, alignment: .trailing)
			.foregroundColor(fontColor)
			.font(.system(size: 12))
	}
}
// MARK: Amount Value
struct AmountValueView: View {
	@Binding var currency:String
	@Binding var value:String
	let fontColor = Color(hex:0x21272A)
	
	var body: some View {
		HStack (spacing:8){
			Spacer()
		Text(currency)
			.foregroundColor(fontColor)
			.font(.system(size: 15))
			.frame(alignment: .trailing)
		Text(value)
			.frame(alignment: .trailing)
			.foregroundColor(fontColor)
			.font(.system(size: 18, weight: .bold, design: .default))
		}
	}
}

// MARK: - Preview
struct GMDropdown_DebitAccount_Previews: PreviewProvider {
    static var previews: some View {
        GMDropdown_DebitAccount()
			.environmentObject(DebitAccountStore())
    }
}
