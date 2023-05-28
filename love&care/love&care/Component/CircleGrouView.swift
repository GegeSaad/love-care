//
//  CircleGrouView.swift
//  love&care
//
//  Created by Engy on 14/05/2023.
//

import SwiftUI

struct CircleGrouView: View {
    var circleColor:Color = .red
    @State var isAnimation:Bool = false
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleColor.opacity(0.2),lineWidth: 50)
                .frame(width: 260,height: 260,alignment: .center)
            Circle()
                .stroke(circleColor.opacity(0.2),lineWidth: 80)
                .frame(width: 260,height: 260,alignment: .center)
        }//zstack
        .scaleEffect(isAnimation ? 1 : 0.5 )
        .animation(.easeOut(duration: 1), value: isAnimation)
        .onAppear{
            isAnimation.toggle()
        }
        
    }
}

struct CircleGrouView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGrouView()
    }
}
