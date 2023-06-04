//
//  DetailProductCardView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 02.06.23.
//

import SwiftUI

struct DetailProductCardView: View {
    var body: some View {
        VStack{
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    Image("petshopping")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    
                    DescriptionView()
                        .offset(y: -35)
                }
                
                HStack {
                    Text("39€/Woche")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("ADD TO CARD")
                            .foregroundColor(.black)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10.0)
                            .foregroundColor(Color("Primary"))
                    })
                }
                .padding()
                .padding(.horizontal)
                .background(Color("Primary")) // Color wurde in Assets definiert
                .cornerRadius(50, corners: .topLeft) // linker Radius
                .frame(maxHeight: .infinity,alignment: .bottom)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
   


    struct DetailProductCardView_Previews: PreviewProvider {
        static var previews: some View {
            DetailProductCardView()
        }
    }


  
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    

}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
