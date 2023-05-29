//
//  PostView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//
import SwiftUI

struct PostView: View {
    let post: Post
    @ObservedObject private var viewModel: NewsViewModel
    
    init(post: Post, viewModel: NewsViewModel) {
        self.post = post
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(post.content)
                .foregroundColor(.black)
                .lineLimit(nil)
            
            if let image = post.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .cornerRadius(10)
            }
            
            HStack {
                Button(action: {
                    // Edit post action
                    viewModel.editPost(post)
                }) {
                    Image(systemName: "pencil")
                }
                .buttonStyle(BorderlessButtonStyle())
                
                Button(action: {
                    // Delete post action
                    viewModel.deletePost(post)
                }) {
                    Image(systemName: "trash")
                }
                .buttonStyle(BorderlessButtonStyle())
                
                Spacer()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}
