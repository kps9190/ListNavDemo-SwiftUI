//
//  CarData.swift
//  ListNavDemo
//
//  Created by ming on 11/27/26.
//

import Foundation
import UIKit
import SwiftUI
var carData: [Car] = loadJson("carData.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("\(filename)을 찾을 수 없습니다")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("\(error)의 문제 인해 \(filename)을 불러올 수 없습니다.")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from :data)
    } catch {
        fatalError("\(error)의 문제로 인해 \(filename)을 불러올 수 없습니다.")
    }
}
