//
//  HomeScreen.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 02.06.23.
//

import SwiftUI

struct HomeScreen : View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "boarding1", "boarding2", "boarding3", "boarding4"]

    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer(minLength: 30)
                    AppBarView()
                    TagLineView()
                        .padding(20)
                    SearchAndScanView()

                    // Restlicher Code...

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0 ..< categories.count) { i in
                                CategoryView(isActive: true, text: "")
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                    HStack{
                    Text("Unser Service Möglichkeiten")
                        .font(.custom("Playfairdisplay-Regular", size: 24))
                        .foregroundColor(.red.opacity(0.7))
                        .padding(.horizontal)
                    Spacer()
                        NavigationLink(destination: MyLittleHelperView()) {
                            Image(systemName: "ellipsis.bubble.fill")
                                .foregroundColor(.black)
                                .padding(.all, 20)
                                .frame(width: 42, height: 42)
                                .cornerRadius(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .background(Color.brown.opacity(0.7))
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    )
                        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("boarding\(index + 1)"), size: 210)
                                    .shadow(color: Color.black.opacity(0.35), radius: 8, x: 2, y: 6)

                            }
                        }
                        .padding(.horizontal)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    )
                    HStack{
                        
                        Text("Produkte des Monats")
                            .font(.custom("Playfairdisplay-Regular", size: 24))
                            .foregroundColor(.red.opacity(0.7))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        Spacer()
                        
                        NavigationLink(destination: ShopView()) {
                            Image(systemName: "bag")
                                .foregroundColor(.black)
                                .padding(.all, 20)
                                .frame(width: 42, height: 42)
                                .cornerRadius(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .background(Color.brown.opacity(0.7))
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    )
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("futter\(index + 1)"), size: 210)
                                    .shadow(color: Color.black.opacity(0.35), radius: 8, x: 2, y: 6)

                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    )
                }
                .padding(.bottom, 80) // Platz für die TabBar lassen
            }
            
            // TabBar am unteren Bildschirmrand anzeigen und fixieren
            VStack {
                Spacer()
                HStack {
                    BottonNavBarItem(image: Image(systemName: "house.fill")) {}
                        .foregroundColor(.black)

                    BottonNavBarItem(image: Image(systemName: "gear")) {}
                        .foregroundColor(.black)

                    BottonNavBarItem(image: Image(systemName: "bag.fill")) {}
                        .foregroundColor(.black)

                    BottonNavBarItem(image: Image(systemName: "clock.fill")) {}
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.brown)
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.vertical, 20) // Hier kannst du den Wert anpassen, um die Höhe der TabBar zu erhöhen
                .shadow(color: Color.black.opacity(0.35), radius: 8, x: 2, y: 6)
            }

        }
    }
}
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
