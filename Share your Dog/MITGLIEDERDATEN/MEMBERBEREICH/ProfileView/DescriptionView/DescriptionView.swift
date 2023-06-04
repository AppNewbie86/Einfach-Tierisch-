//
//  DescriptionView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 02.06.23.
//

import SwiftUI
// AngebotsView im Detail
struct DescriptionView: View {
    var body: some View {
      
            VStack(alignment: .leading, spacing: 8) {
                // Title
                Text("Service Angebot")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                // For Each Schleife mit Sterne
                HStack(spacing: 4) {
                    ForEach(0..<5) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    Text("(4.9)")
                        .opacity(0.85)
                        .padding(.leading, 20)
                        .foregroundColor(.black)
                    Spacer()
                }
                Text("Description")
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                
                
                Text("Hier bieten wir euch einen Shopping Service für euren Liebsten Gefährten an wo alles für Sie besorgt wenn Sie mal keine Zeit haben. Deshalb buchen Sie uns ganz einfach über den Button unten und füllen Sie unser Formular aus.")
                    .foregroundColor(.black)
                    .lineSpacing(8.0)
                    .opacity(0.5)
                
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        Text("Größen")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(.bottom, 4)
                        Text("alle Größen möglich")
                            .foregroundColor(.black)
                            .fontWeight(.thin)
                            .opacity(0.6)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(alignment: .leading) {
                        Text("Privates Feedback")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.bottom, 4) // schafft einen Abstand zw. title und text
                            .opacity(0.6)
                        
                        Text("Immer wieder gerne\nwar schnell und einfach gebucht\nund alle waren sehr\nnett")
                            .foregroundColor(.black)
                            .fontWeight(.thin)
                            .opacity(0.6)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical)
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading){
                        Text("Erfahrung wählen")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        // Aufruf der ColorDotView
                        HStack {
                            ColorDotView(color: .brown)
                            ColorDotView(color: .purple)
                            ColorDotView(color: Color("Primary"))
                        }


                    }
                    
                    Spacer()
                    // Button Segment um Anzahl auszuwählen
                   
                    VStack(alignment: .leading) {
                        Text("Quantity")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)

                        HStack {
                            Button(action: {}) {
                                Image(systemName: "minus")
                                    .padding(.all, 8)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 30, height: 30)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke())
                            .foregroundColor(.black)
                            
                            Text("1")
                                .font(.title2)
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 8)

                            Button(action: {}) {
                                Image(systemName: "plus")
                                    .padding(.all, 8)
                            }
                           // .frame(width: 30, height: 30)
                            .background(Color.brown)
                            .clipShape(Circle())                    .foregroundColor(.white)
                        }
                    }
                }
                
                
            }
            .padding()
            .padding(.top)
            .background(Color("ColorBeige"))
            .cornerRadius(40)
        }
    }
    

    
    
    struct DescriptionView_Previews: PreviewProvider {
        static var previews: some View {
            DescriptionView()
        }
    }


