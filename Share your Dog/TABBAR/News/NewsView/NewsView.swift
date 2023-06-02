import SwiftUI

struct NewsView: View {
    @ObservedObject private var viewModel: NewsViewModel
    @State private var selectedTab = "NewsView" // Track the selected tab

    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.brown.opacity(0.250), .brown.opacity(0.80)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.posts) { post in
                            PostView(post: post, viewModel: viewModel)
                        }
                        
                    }
                    .padding()
                }
                .navigationTitle("News")
                .navigationBarItems(trailing: addButton)
            }
            .sheet(isPresented: $viewModel.isShowingAddSheet) {
                AddPostView(viewModel: viewModel)
            }
        }
       
    }
    private var addButton: some View {
        Button(action: {
            viewModel.showAddSheet()
        }) {
            Image(systemName: "plus")
                .font(.title)
        }
    }
}
