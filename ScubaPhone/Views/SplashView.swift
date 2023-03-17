//
//  OnboardingView.swift
//  ScubaPhone
//
//  Created by Filippo on 16/03/23.
//

import Foundation
import SwiftUI

struct SplashView: View{
    
    @State var isActive: Bool = false
    
    var body: some View{
        ZStack{
            if self.isActive {
                StartView()
            } else {
            Image("splash")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text("ScubaPhone")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .padding()
                    .foregroundColor(.red)
                }
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                withAnimation{
                    self.isActive = true
                }
            }
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SplashView()
        }
    }
}
