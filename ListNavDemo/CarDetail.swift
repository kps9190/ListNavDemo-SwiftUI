//
//  CarDetail.swift
//  ListNavDemo
//
//  Created by ming on 11/28/26.
//

import SwiftUI

struct CarDetail: View {
    let selectedCar: Car
    
    var body: some View {
        
        Form {
            Section(header: Text("차량 상세정보")) {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("하이브리드")
                        .font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ?
                          "checkmark.circle" : "xmark.circle" )
                }
            }
        }
    }
    
    struct carDetail_Previews: PreviewProvider {
        static var previews: some View {
            CarDetail(selectedCar: carData[0])
        }
    }
}

//#Preview {
//    CarDetail()
//}
