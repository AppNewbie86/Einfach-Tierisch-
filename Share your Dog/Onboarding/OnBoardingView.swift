import SwiftUI

struct OnBoardingView: View {
    
    @AppStorage("onBoarding")  var onBoarding = true
    
    @State private var showAfterOnBoarding = false // Neuer Zustand hinzugefügt
    
    @State private var current = 1
    
    var body: some View {
        
            ZStack {
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.brown.opacity(0.15), .brown.opacity(0.65)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                Image("Opening Screen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.6)
                
            VStack(alignment: .center) {
                HStack {
               //     Spacer()
                    Button(action: {
                        onBoarding = false
                    }) {
                        Text("Continue")
                            .foregroundColor(.white)

                        Image(systemName: "chevron.right")
                    }

                    .background(
                        Capsule()
                            .fill(Color(.brown).opacity(0.6))
                            .frame(width: 100, height: 30)
                    )
                   // .padding(.trailing, 20)
                }//.padding()
                
                if current == 1 {
                    
                    OnboardItem(image: "pic3", title: "Help Today\n before to Late", description: "find helpfull Dogs and Cats")
                        .transition(AnyTransition.slide.animation(.spring()))
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 600)

                        .animation(.default)
                }
                
                if current == 2 {
                    
                    OnboardItem(image: "pic2", title: "You can take Path of Dog", description: "many Dogs and Cats have no Home ")
                        .transition(AnyTransition.slide.animation(.spring()))
                        .multilineTextAlignment(.center)

                        .frame(width: 300, height: 600)

                        .animation(.default)
                }
                
                if current == 3 {
                    
                    OnboardItem(image: "pic4", title: "Animals\nlove us", description: "The Best Friend of a Person. He loved when you cry and when you smile")
                        .transition(AnyTransition.slide.animation(.spring()))
                        .multilineTextAlignment(.center)

                        .frame(width: 300, height: 600)

                        .animation(.default)
                }
                
                HStack {
                    HStack(spacing: 12) {
                        
                        Capsule()
                            .frame(width: 18, height: 4)
                            .foregroundColor(current == 1 ? Color("ColorBrown") : Color("ColorBrown").opacity(0.3))
                        
                        Capsule()
                            .frame(width: 18, height: 4)
                            .foregroundColor(current == 2 ? Color("ColorBrown") : Color("ColorBrown").opacity(0.3))
                        
                        Capsule()
                            .frame(width: 18, height: 4)
                            .foregroundColor(current == 3 ? Color("ColorBrown") : Color("ColorBrown").opacity(0.3))
                    }
                    
                  //  Spacer()
                    
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color("ColorBrown"))
                        .overlay(
                            Image(systemName: current == 3 ? "checkmark" : "arrow.right")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .onTapGesture {
                            if current == 3 { // Neuer Code hinzugefügt
                                showAfterOnBoarding = true
                            } else {
                                withAnimation {
                                    current += 1
                                }
                            }
                        }
                    
                }
               // .padding(20)
            }
        }
    }
    
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
