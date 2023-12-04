//
//  SetTimer.swift
//  Game from 0
//
//  Created by Muna Aiman Al-hajj on 20/05/1445 AH.
//

import SwiftUI

struct SetTimer: View {
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("purpleBack")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .ignoresSafeArea()
                
                Image("timerGlass")
                    .resizable()
                    .frame(width: 370,height: 500)
                    
//            Rectangle()
//            .fill(.black.opacity(0.08))
//            .frame(width: 800,height: 100)
//            .padding(16)
                
                
                VStack{
                    Text("Set the timer")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .position(x:200,y:250)
                    HStack{
                        Text("Min")
                            .font(.headline)
                            .bold()
                            .padding(28)
                        
                        Picker("", selection: $minutes) {
                            ForEach(0...15, id: \.self) { minute in
                                Text("\(minute)")
                                    .tag(minute)
                            }
                        }
                        //.position(CGPoint(x: 100, y: 240))
                        
                        .pickerStyle(.wheel)
                        
                        // Text("Seconds:")
                        .font(.title)
                        .bold()
                        
                        Text(":")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        
                        Picker("", selection: $seconds) {
                            ForEach(0...59, id: \.self) { second in
                                Text("\(second)")
                                    .tag(second)
                            }
                        }
                        .pickerStyle(.wheel)
                        
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .pickerStyle(.inline)
                        
                        Text("Sec")
                            .font(.headline)
                            .bold()
                            .padding(28)
                        
                    }//Hstack
                    .position(x:200,y:80)
                    
                    HStack{
                    
                    NavigationLink(destination: GameCodePage() .navigationBarBackButtonHidden(true)
                    ){
                        
                        Text("Set time")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color(red: 0.317, green: 0.22, blue: 0.643))
                        
                        
                            .padding()
                            .frame (width:320,height: 70)
                            . foregroundColor( .white)
                            .background(Color.white.gradient).opacity(0.9)
                            .cornerRadius (15)
                            .padding(16)
                            
                        
                    }
                }//Hstack
                    .position(x:200,y:20)
                    
                    
                }//Vstack
                
                
            }//Zstack
        }//NavigationView{
          
        }//var body: some View
    }//struct setTimer1: View

#Preview {
    SetTimer()
}

