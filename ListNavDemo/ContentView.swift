//
//  ContentView.swift
//  ListNavDemo
//
//  Created by ming on 11/27/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var carStore : CarStore = CarStore(cars: carData)
    
    var body: some View {
        
        VStack {
            Text("자동차 종류")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            List {
                ForEach (0..<carStore.cars.count, id: \.self) { i in
                    ListCell(car: carStore.cars[i])
                }
            }
        }
    }
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
        }
    }
}

#Preview {
    ContentView()
}
