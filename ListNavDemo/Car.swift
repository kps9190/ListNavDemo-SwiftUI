//
//  Car.swift
//  ListNavDemo
//
//  Created by ming on 11/27/26.
//

// 이 파일은 carData.json의 구조를 그대로 따르고 있습니다.

import Foundation
import SwiftUI

struct Car : Codable, Identifiable {
    var id : String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}
