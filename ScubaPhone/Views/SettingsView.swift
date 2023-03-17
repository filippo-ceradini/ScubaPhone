//
//  Settings.swift
//  ScubaPhone
//
//  Created by Filippo on 17/03/23.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @State private var useMetric = false
    @State private var useGPS = false
    @State private var displayDecoInfo = false
    @State private var displayCompass = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Use Metric")
                Spacer()
                Toggle("", isOn: $useMetric)
            }
            HStack {
                Text("Use GPS")
                Spacer()
                Toggle("", isOn: $useGPS)
            }
            HStack {
                Text("Display Deco Info")
                Spacer()
                Toggle("", isOn: $displayDecoInfo)
            }
            HStack {
                Text("Enable Compass")
                Spacer()
                Toggle("", isOn: $displayCompass)
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("Settings")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            
            
    }
}
