//
//  CarStore.swift
//  ListNavDemo
//
//  Created by ming on 11/28/26.
//

import Foundation
import SwiftUI
import Combine

class CarStore: ObservableObject {
    
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
