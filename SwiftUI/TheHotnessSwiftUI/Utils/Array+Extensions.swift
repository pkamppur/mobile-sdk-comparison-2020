//
//  Array+Extensions.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 28.9.2020.
//


import Foundation

extension Array {
    @inlinable public static func += (array: inout [Element], item: Element) {
        array.append(item)
    }
}
