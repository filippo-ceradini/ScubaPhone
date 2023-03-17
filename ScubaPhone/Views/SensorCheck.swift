//
//  BluetoothConnect.swift
//  ScubaPhone
//
//  Created by Filippo on 17/03/23.
//

import Foundation
import SwiftUI


class ViewModel: ObservableObject {
    @Published var sensorData: [SensorData] = []
    
    func fetch() {
        guard let url = URL(string: "http://localhost:3000/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error  in
            guard let data = data, error == nil else {
                var disconnected: [SensorData] = []
                let newSensorData = SensorData(depth: "Disconnected", temp: "Disconnected")
                disconnected.append(newSensorData)
                self?.sensorData = disconnected
                return
            }
            
            do {
                let sensorData = try JSONDecoder().decode([SensorData].self, from: data)
                DispatchQueue.main.async {
                    self?.sensorData = sensorData
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

struct UpdaterView: View {
    var body: some View {
           TimelineView(.periodic(from: .now, by: 1.0)) { timeline in
               SensorView(now: timeline.date)
           }
    }
}


struct SensorView: View {
    @StateObject var viewModel = ViewModel()
    @State var index = 0
    var now: Date
    @State var start: Date = Date() // Keep constant everytime
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.sensorData, id: \.self) { data in
                    VStack {
                        HStack{
                            Text("Depth")
                            Text(data.depth).bold()
                        }
                        HStack{
                            Text("Temp")
                            Text(data.temp).bold()
                        }
                        
                    }.padding(3)
                }
            }
            .navigationTitle("Sensor Check")
            .onAppear {
                viewModel.fetch()
            }
            .onChange(of: now) { _ in
                index += 1
                viewModel.fetch()
            }
        }
    }
}

struct UpdaterView_Previews: PreviewProvider {
    static var previews: some View {
        UpdaterView()
    }
}


