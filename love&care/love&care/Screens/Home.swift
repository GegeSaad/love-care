//
//  Home.swift
//  love&care
//
//  Created by Engy on 14/05/2023.
//

import SwiftUI

struct Home: View {
    @AppStorage("isBorading") var isBorading:Bool = false
    @State var isAnmation:Bool = false

    var body: some View {
        VStack(alignment: .center,spacing: 30) {
            ZStack{
//MARK: - HEADER
                CircleGrouView(circleColor: .gray)
                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300,alignment: .center)
                    .offset(y: isAnmation ? 30 : -30)
                    .animation(.easeOut(duration: 2.5).repeatForever(autoreverses: true),value: isAnmation)
            }//:Zstack
            
//MARK: - CENTER
            Text("Having children just puts the whole world into perspective. Everything else just disappears")
                .padding()
                .multilineTextAlignment(.center)
                .font(.title3)
                .foregroundColor(.gray)
//MARK: - FOOTER
            Button{
                isBorading.toggle()
                PlaySound(sound: "success", type: "m4a")
                
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart")
                    .font(.system(size: 35,design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
        }//:Vstack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                isAnmation.toggle()
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
