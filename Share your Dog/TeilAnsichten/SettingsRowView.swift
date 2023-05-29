//
//  SettingsRowView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 08.05.23.
//

import SwiftUI

struct SettingsRowView: View {
    
    let imageName: String
    let title: String
    let tintColor: Color

    var body: some View {
            HStack(spacing: 12) {
                Image(systemName: imageName)
                    .imageScale(.small)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.red)
                
            }
        }
    }


struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}
