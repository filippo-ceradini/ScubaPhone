//
//  Json.swift
//  ScubaPhone
//
//  Created by Filippo on 17/03/23.
//

import Foundation
import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct CiaoView: View {
    @State private var results = [Result]
    
    var body: some View {
        List(result.id: \.trackId){ item in
            VStack(alignment: .leading){
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task{
            await loadData()
        }
        func loadData() async {
            guard let url = URL(string: "http://localhost:3000/") else {
                    fatalError("Invalid URL")
                }
            
                do{
                    let (data, _) = try await URLSession.shared.data(from: url)
                    if let decodedResponse = try? JSONDecoder.decode(Response.self, from:data){
                        results = decodedResponse.result
                    }
            
                } catch {
                    print("invalid code")
                }
        }
    }
}

struct Ciao_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CiaoView()
        }
    }
}
