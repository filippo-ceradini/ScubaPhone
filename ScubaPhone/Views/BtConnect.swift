//
//  SensorCheck.swift
//  ScubaPhone
//
//  Created by Filippo on 17/03/23.
//

import Foundation
import SwiftUI

struct BtConnectView: View {
    
    let devices = [
        "iPhone Bluetooth Headset",
        "iPad Keyboard",
        "Macbook Pro",
        "Apple Watch",
        "AirPods",
        "Beats Studio Headphones"
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Bluetooth Devices")
                .font(.title)
                .padding(.bottom, 20)
            
            ForEach(devices, id: \.self) { device in
                HStack() {
                    Text(device)
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                .padding(.bottom, 10)
            }
        }
        .padding()
        .navigationBarTitle("Settings")
    }
}

struct BtConnect_Previews: PreviewProvider {
    static var previews: some View {
        BtConnectView()
    }
}

