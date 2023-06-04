
//
//import SwiftUI
//
// struct ServiceCardView: View {
//     let card: ServiceCards
//
//     var body: some View {
//         VStack(spacing: 8) {
//             Image(card.imageName)
//                 .resizable()
//                 .aspectRatio(contentMode: .fill)
//                 .frame(height: 300)
//                 .cornerRadius(10)
//
//             Text(card.name)
//                 .font(.headline)
//                 .fontWeight(.semibold)
//                 .frame(height: 300)
//                 .cornerRadius(10)
//
//             Text(card.name)
//                 .font(.headline)
//                 .fontWeight(.semibold)
//                 .foregroundColor(.black)
//         }
//         .padding()
//         .padding(.vertical, 8)
//     }
// }
//
//
//struct ServiceCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ServiceCardView(card: ServiceCards(name: "Training", imageName: "service1"))
//    }
//}
