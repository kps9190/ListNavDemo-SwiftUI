//
//  ContentView.swift
//  ListNavDemo
//
//  Created by ming on 11/27/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var carStore : CarStore = CarStore(cars: carData)
    @State private var stachPath = NavigationPath()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                List {
                    ForEach (0..<carStore.cars.count, id: \.self) { i in
                        NavigationLink(value: i) {
                            ListCell(car: carStore.cars[i])
                        }
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                .navigationDestination(for: Int.self) {
                    i in CarDetail(selectedCar: carStore.cars[i])
                }
                .navigationDestination(for: String.self) { _ in AddNewCar(carStore: self.carStore, path: $stachPath)
                }
                .navigationBarTitle(Text("전기차"))
                .navigationBarItems(leading: NavigationLink(value: "차량 추가") {
                    Text("추가")
                        .foregroundColor(.blue)
                }, trailing: EditButton())
            }
        }
    }
        
        func deleteItems(at offsets: IndexSet) {
            carStore.cars.remove(atOffsets: offsets)
        }
        
        func moveItems(from source: IndexSet, to destination: Int) {
            carStore.cars.move(fromOffsets: source, toOffset: destination)
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
