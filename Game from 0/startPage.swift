//
//  startPage.swift
//  Game from 0
//
//  Created by Muna Aiman Al-hajj on 20/05/1445 AH.
//

import SwiftUI

struct startPage: View {
    var body: some View {
        NavigationView {
        
        VStack{
            
            ZStack {
                ZStack{
                    Image("najdStartGame")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        
                        .ignoresSafeArea()
                        //.blur(radius: 10)
                    
                    
                    VStack(spacing: 14) {
                        Image("in1")
                            .resizable()
                            .frame(width: 330, height: 330)
                            .padding()
                   
                    
                    
                    
                    
                        VStack {
                            
                            
                            
                            HStack {
                                VStack(spacing: 50)
                                {
                                    
                                        
                                        NavigationLink(destination:SetTimer()       .navigationBarBackButtonHidden(true)) {
                                        Text("Start new game")
                                            .fontWeight(.bold)
                                            .font(.title)
                                            .foregroundColor(Color(red: 0.317, green: 0.22, blue: 0.643))
                                        
                                    }
                                    
                                }
                                
                                
                                
                            }
                            .padding()
                            .frame (maxWidth: .infinity)
                            . foregroundColor( .white)
                            .background(Color.white.gradient).opacity(0.9)
                            .cornerRadius (15)
                            .padding()
                            
                            HStack (spacing:20){
                                VStack(spacing: 20) {
                                    
                                    NavigationLink(destination: SetTimer() .navigationBarBackButtonHidden(true) ) {
                                        Text("Join exiting game")
                                            .fontWeight(.bold)
                                            .font(.title)
                                            .foregroundColor(Color(red: 0.317, green: 0.22, blue: 0.643))
                                        
                                    }
                                        
                                    
                                    
                                    
                                }
                                
                                
                                
                                
                            }
                            .padding()
                            .frame (maxWidth: .infinity)
                            . foregroundColor( .white)
                            .background(Color.white.gradient).opacity(0.9)
                            .cornerRadius (15)
                            .padding()
                            
                            
                            
                            
                        }
                            
                        }
                        
                    }
                }
              
            }
            
            
        }
        
    }
}

#Preview {
    startPage()
}


