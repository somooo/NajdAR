//
//  SplashScreen.swift
//  Game from 0
//
//  Created by Muna Aiman Al-hajj on 20/05/1445 AH.
//

import SwiftUI

struct SplashScreen: View {
    
     @State private var isActive=false
     @State private var size = 0.7
    @State private var opacity = 0.5
     
     var body: some View {
     if isActive {
     Story1()
     } else {
     ZStack{
     
     VStack {
     
     VStack {
     Image("SplashScreen")
          //   .resizable()
             .scaledToFill()
             .edgesIgnoringSafeArea(.all)
         
          //   .ignoresSafeArea()
     
     }
     
     .scaleEffect(size)
     .opacity(opacity)
     .onAppear {
     withAnimation(.easeIn(duration: 1.2)) {
     self.size = 0.60
         self.opacity = 1
     }
     }
     }
     .onAppear {
     DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
     withAnimation {
     self.isActive = true
     }
     }
     }
     }
     }
     }
     }
     

#Preview {
    SplashScreen()
}

#Preview {
    SplashScreen()
}
