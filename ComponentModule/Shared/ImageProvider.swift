//
//  Image.swift
//  ComponentModule
//
//  Created by 60067670 on 2022/01/26.
//

import SwiftUI

public class ImageProvider {
	// convenient for specific image
	public static func picture() -> UIImage {
		return UIImage(named: "picture", in: Bundle(for: self), with: nil) ?? UIImage()
	}

	// for any image located in bundle where this class has built
	public static func image(named: String) -> UIImage? {
		return UIImage(named: named, in: Bundle(for: self), with: nil)
	}
}
