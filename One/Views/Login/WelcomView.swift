//
//  WelcomView.swift
//  One
//
//  Created by 无限进步 on 6/2/25.
//

import SwiftUI

struct WelcomView: View {
    var body: some View {
        ZStack{
            Image("welcome_screen")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .widthPer(per: 0.5))
                    .padding(.top, .topInsets + 8)
                
                
                Spacer()
                Text("Congue malesuada in ac justo, a tristique\nleo massal. Arcu leo leo urnarisus.")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.regular, fontSize: 14))
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                Button {
                    
                } label: {
                    ZStack{
                        Image("primary_btn")
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal, 20)
                            .frame(width: .screenWidth, height: 48)
                        
                        
                        Text("登陆")
                            .font(.customfont(.semibold, fontSize: 20))
                            .padding(.horizontal, 20)
                    }
                   
                }
                .foregroundColor(.white)
                .shadow(color: .secondaryC.opacity(0.3), radius: 5, y: 3)
                .padding(.bottom, .bottomInsets)
                
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomView()
}
