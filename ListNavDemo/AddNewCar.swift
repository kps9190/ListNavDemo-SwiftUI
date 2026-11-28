//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by ming on 11/28/26.
//

import Foundation
import SwiftUI

struct AddNewCar: View {
    
    @StateObject var carStore : CarStore
    @Binding var path: NavigationPath
    @State private var isHybrid = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("자동차 정보")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "모델", userInput: $name)
                DataInput(title: "설명", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("하이브리드")
                        .font(.headline)
                }
                .padding()
            }
            
            Button(action: addNewCar) {
                Text("차량 추가")
            }
        }
    }
    
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString,
                         name: name,
                         description: description,
                         isHybrid: isHybrid,
                         imageName: "tesla_model_3")
        carStore.cars.append(newCar)
        path.removeLast()
    }
    

    
    struct DataInput: View {
        
        var title: String
        @Binding var userInput: String
        
        var body: some View {
            VStack(alignment: HorizontalAlignment.leading) {
                Text(title)
                    .font(.headline)
                TextField("\(title)을 입력하세요", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
        }
    }
}

// 탐색 뷰 전달이라 더 이상 필요가 없음
//struct AddNewCar_Preview: PreviewProvider {
//    static var previews: some View {
//        AddNewCar(carStore: CarStore(cars: carData))
//    }
//}
