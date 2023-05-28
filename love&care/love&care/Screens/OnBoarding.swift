//
//  OnBoarding.swift
//  love&care
//
//  Created by Engy on 14/05/2023.
//

import SwiftUI

struct OnBoarding: View {
    @AppStorage("isBorading") var isBorading:Bool = true
    @State var isAnimation:Bool = false
    @State var imageOffSet:CGSize = CGSize(width: 0, height: 0)
    @State var buttonOffSet:CGFloat = 0.0
    @State var buttonWidth: Double = UIScreen.main.bounds.width - 80
    let feedBack = UINotificationFeedbackGenerator()
    var body: some View {
        ZStack{
            Color("ColorBlue").ignoresSafeArea(.all)
            VStack{
// MARK: - HEADER
                VStack{
                    Text(abs(imageOffSet.width)>0 ? "Care." : "LOVE.")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .font(.system(.largeTitle))
                        .foregroundColor(.white)
                    Text("life doesn't come with amanual, it come with amother")
                    
                        .fontWeight(.light)
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.horizontal,50)
                        .multilineTextAlignment(.center)
                }//zstach_header
                .offset(y: isAnimation ? 0: -40)
                .animation(.easeOut(duration: 1), value: isAnimation)
                
                Spacer()
                //MARK: - CENTER
                ZStack{
                    CircleGrouView(circleColor: .white)
                        .offset(x: -(imageOffSet.width))
                        .blur(radius: abs(imageOffSet.width / 5) ,opaque: false)
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(isAnimation ? 1 : 0.8)
                        .animation(.easeOut(duration: 1), value: isAnimation)
                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 8, x: 3, y: 30)
                        .overlay(Image(systemName: "arrow.left.and.right.circle")
                            .font(.system(size: 40,weight: .ultraLight,design: .rounded))
                            .foregroundColor(.white)
                            .opacity(abs(imageOffSet.width)>0 ? 0 : 1)
                                 ,alignment: .bottom)
                        .frame(width: 250,alignment: .center)
                        .offset(x:imageOffSet.width,y:0)
                        .rotationEffect(.degrees(imageOffSet.width / 15))
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if
                                    abs(gesture.translation.width) <= 150 {
                                    imageOffSet = gesture.translation
                                }
                            })
                                .onEnded({ _ in
                                    withAnimation(.easeIn(duration: 0.5)){
                                        imageOffSet = .zero
                                    }
                                   
                                })
                        )
                }//zstack center
                Spacer()
                //MARK: - FOOTER
                ZStack{
                    //1.background
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    //2.text
                    Text("Start")
                        .font(.system(size: 30, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    //3.capsule dynamic
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                        .frame(width: 80 + buttonOffSet)
                        .padding(.horizontal,8)
                        Spacer()
                    }
                    
                    //4. dragable circle
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            Image(systemName:"chevron.forward.2")
                                .foregroundColor(.white)
                                .font(.system(size: 25,weight: .bold,design: .rounded))
                            
                        }
                        .offset(x: buttonOffSet)
                        .frame(width: 80,alignment: .center)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 0.0 && buttonOffSet <= (buttonWidth-80) {
                                    buttonOffSet = gesture.translation.width
                                }
                            })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.5)) {
                                        if buttonOffSet >= buttonWidth/2{
                                            isBorading.toggle()
                                            PlaySound(sound: "chimeup", type: "mp3")
                                            feedBack.notificationOccurred(.success)
                                        }else{
                                            buttonOffSet = 0.0
                                            feedBack.notificationOccurred(.error)
                                        }
                                        
                                    }
                                })
                        )
                        Spacer()
                    }
                    
                }//zstack footer
                .frame(height: 80,alignment: .center)
                .padding(.horizontal,40)
                .offset(y: isAnimation ? 0 :40)
                .animation(.easeOut(duration: 1), value: isAnimation)
               
            }
        }
        .onAppear{
            isAnimation.toggle()
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
