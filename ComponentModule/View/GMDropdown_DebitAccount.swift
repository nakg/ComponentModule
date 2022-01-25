//
//  GMDropdown_DebitAccount.swift
//  ComponentModule
//
//  Created by 60067670 on 2022/01/25.
//

import SwiftUI

public struct GMDropdown_DebitAccount: View {
	@EnvironmentObject var store: DebitAccountStore
	
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
							HStack {
								Text("test")
								Image("iconArrowDown")
								Image("arrow")
								Image("iconArrowDown", bundle: Bundle.main)
								Image("iconArrowDown", bundle: Bundle(identifier: "ComponentAssets"))
								Image(systemName: "iconArrowDown")
								Image("iconArrowDown", bundle: Bundle.main)
							}
							
							Text("test")
						}
						VStack(spacing: 4.0) {
							Text("test")
							Text("test")
						}
					}
				}
				.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
				LineView(height: .constant(5.0))
			}
		})
	}
}

// MARK: Line View
struct LineView: View {
	@Binding public var height:CGFloat
	var bottomTumbLineColor = Color(UIColor.systemRed)
	var body: some View {
		Rectangle()
			.foregroundColor(bottomTumbLineColor)
			.frame(height: height)
	}
}

// MARK: - Preview
struct GMDropdown_DebitAccount_Previews: PreviewProvider {
    static var previews: some View {
        GMDropdown_DebitAccount()
    }
}
