//
//  StartView.swift
//  ScubaPhone
//
//  Created by Filippo on 17/03/23.
//

import Foundation
import SwiftUI


struct StartView: View {
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 16) {
                    Spacer()
                    Image("diver")
                        .resizable()
                        .frame(width: 200, height: 100)
                        .scaledToFill()
                        
                    NavigationLink(destination: UpdaterCompView()) {
                    Text("Start Dive")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        }
                        .buttonStyle(ScubaButtonStyle())
                        .padding(.bottom, 10)
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        }
                        .buttonStyle(ScubaButtonStyle())
                        .padding(.bottom, 10)
                    NavigationLink(destination: UpdaterView()) {
                        Text("Sensor")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        }
                        .buttonStyle(ScubaButtonStyle())
                        .padding(.bottom, 10)
                    NavigationLink(destination: BtConnectView()) {
                        Text("Bluetooth")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        }
                        .buttonStyle(ScubaButtonStyle())
                        .padding(.bottom, 10)
                    NavigationLink(destination: LogBookView()) {
                    Text("Logbook")
                        .fontWeight(.medium)
                        .foregroundColor(.black)}
                        .buttonStyle(ScubaButtonStyle())
                    Spacer()
                }
            }
        }
    }
}

struct ScubaButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 16)
            .frame(height: 48)
            .background(Color.white)
            .foregroundColor(Color.gray)
            .font(.system(size: 18, design: .monospaced))
            .cornerRadius(4)
            .shadow(color: Color(red: 45/255, green: 35/255, blue: 66/255, opacity: 0.4), radius: 2, x: 0, y: 2)
            .shadow(color: Color(red: 45/255, green: 35/255, blue: 66/255, opacity: 0.3), radius: 7, x: 0, y: 13)
            .shadow(color: Color(red: 214/255, green: 214/255, blue: 231/255), radius: 0, x: 0, y: -3  )
            .padding(.horizontal, 1)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(red: 214/255, green: 214/255, blue: 231/255), lineWidth: 1.5)
                    .padding(-1)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .contentShape(Rectangle())
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StartView()
        }
    }
}
