//
//  ComputerView.swift
//  ScubaPhone
//
//  Created by Filippo on 17/03/23.
//

import Foundation
import SwiftUI

struct SensorData: Hashable, Codable {
    let depth: String
    let temp: String
}

class ComputerViewModel: ObservableObject {
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

struct UpdaterCompView: View {
    var body: some View {
           TimelineView(.periodic(from: .now, by: 1.0)) { timeline in
               ComputerView(now: timeline.date)
           }
    }
}

struct ComputerView: View {
    @StateObject var viewModel = ComputerViewModel()
    @State var index = 0
    var now: Date
    @State var start: Date = Date() // Keep constant everytime
    var body: some View {
        ZStack {
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        ForEach(viewModel.sensorData, id: \.self) { data in
                        VStack(alignment: .leading, spacing: 0){
                            Text("Depth")
                            Text(data.depth)
                                .font(.system(size: 72))
                                .fontWeight(.medium)
                            Spacer()
                        }}
                        Spacer()
                        VStack(alignment: .trailing, spacing: 0){
                            Text("Dive Time")
                            
                            HStack{
                                Text("26")
                                    .font(.system(size: 60))
                                    .fontWeight(.medium)
                                VStack{
                                    Spacer()
                                    Text("min")
                                        .font(.system(size: 32))
                                        .fontWeight(.medium)
                                    Spacer()
                                }
                                
                            }
                            Spacer()
                        }
                    }.frame(alignment: .top)
                    Spacer()
                    
                    LazyHStack{
                        Spacer()
                        Text("Alert")
                            .foregroundColor(.red)
                            .font(.system(size: 72))
                            .fontWeight(.medium)
                        Spacer()
                    }.frame(maxWidth: .infinity,  alignment: .top)
                    Spacer()
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 0){
                            Spacer()
                            Text("Max Depth")
                            
                            Text("45m")
                                .font(.system(size: 60))
                                .fontWeight(.medium)
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 0){
                            Spacer()
                            Text("Deco info")
                        
                            Text("Just Safety Stop")
                                .font(.system(size: 23))
                                .fontWeight(.medium)
                        }
                    }.frame(alignment: .bottom)
                }
                Spacer()
                VStack{
                    HStack{
                        Text("Gps ")
                        Image(systemName: "antenna.radiowaves.left.and.right").foregroundColor(.red)
                    }
                    
                    Spacer()
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 280)
                    Spacer()
                    HStack{
                        Text("Avg. Depth")
                        Text("28m")
                        .foregroundColor(.blue)}
                    ForEach(viewModel.sensorData, id: \.self) { data in
                    HStack{
                        Text("Water Temp")
                        Text(data.temp)
                        .foregroundColor(.blue)}}
                }
            }
            .padding()
        }.onAppear {
            viewModel.fetch()
        }
        .onChange(of: now) { _ in
            index += 1
            viewModel.fetch()
        }
        .edgesIgnoringSafeArea(.all)
    }
        
}

struct UpdaterCompView_Previews: PreviewProvider {
    static var previews: some View {
        UpdaterCompView()
    }
}
