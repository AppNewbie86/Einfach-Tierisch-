//
//  NewsViewModel.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//
import Foundation
import Combine
import UIKit

class NewsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isShowingAddSheet = false
    
    private var allPosts: [Post] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Simulated data for testing
        self.posts = [
            Post(title: "DOGGYNEWSPOST #1", content: "Pet Fokus: machte meinen Hund wieder lebendig und Lebensfroh", image: UIImage()),
            Post(title: "DOGGYNEWSPOST #2", content: "Hilfe mein Hund ist ein Langschläfer", image: UIImage()),
            Post(title: "DOGGYNEWSPOST #3", content: "Mai Zeit ist Zeckenzeit !\nJetzt einen Termin bei eurem Tierarzt vereinbaren", image: UIImage()),
            Post(title: "DOGGYNEWSPOST #4", content: "Ein rohes Ei verbessert das Fell", image: UIImage()),
            Post(title: "DOGGYNEWSPOST #5", content: "Was haltet ihr von einem Tag des Hundes wo wir einfach unserem besten Freund auch einen Tag schenken wo wir zeigen das wir an ihn denken", image: UIImage())
        ]
        
        self.allPosts = posts
        
        // Example code to simulate loading posts from an API or database
        Timer.publish(every: 10, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.fetchPosts()
            }
            .store(in: &cancellables)
    }
    
    func showAddSheet() {
        isShowingAddSheet = true
    }
    
    func addPost(_ post: Post) {
        posts.append(post)
        allPosts.append(post)
    }
    
    func editPost(_ post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index] = post
            if let allPostsIndex = allPosts.firstIndex(where: { $0.id == post.id }) {
                allPosts[allPostsIndex] = post
            }
        }
    }

    func deletePost(_ post: Post) {
        posts.removeAll(where: { $0.id == post.id })
        allPosts.removeAll(where: { $0.id == post.id })
    }

    
    func filteredPosts(searchText: String) -> [Post] {
        if searchText.isEmpty {
            return posts
        } else {
            return posts.filter { post in
                return post.title.lowercased().contains(searchText.lowercased()) ||
                    post.content.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private func fetchPosts() {
        // Simulated API or database call to fetch new posts
        let newPosts = [
            Post(title: "Eine frühe Erkennung\nlässt schlimmeres verhindern", content: "Erkennen Sie die Symptome und geben Sie so ihrem Hund die Pflege die er brauch und wieder mit Lebensfreude verwandelt", image: UIImage()),
            Post(title: "New Post 2", content: "Consectetur adipiscing elit", image: UIImage()),
            Post(title: "New Post 3", content: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", image: UIImage())
        ]
        
        posts.append(contentsOf: newPosts)
        allPosts.append(contentsOf: newPosts)
    }
}
