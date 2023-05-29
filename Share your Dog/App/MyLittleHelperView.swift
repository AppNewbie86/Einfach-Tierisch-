

import Foundation
import Alamofire
import Combine
class OpenAIService {
    
    let baseUrl = "https://api.openai.com/v1/"
    
    func sendMessage(message: String) -> AnyPublisher<OpenAICompletionsResponse, Error> {
        
        let body = OpenAICompletionsBody(model: "text-davinci-003", prompt: message, temperature: 0.7, max_tokens: 256)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.openAIAPIKey)"
        ]
        
        return Future {[weak self] promise in
            guard let self = self else {return}
            AF.request(self.baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).responseDecodable(of:
                 OpenAICompletionsResponse.self) { response in
                switch response.result {
                case.success(let result):
                    promise(.success(result))
                case.failure(let error):
                    promise(.failure(error))

                }
                
            }
            
        }
        .eraseToAnyPublisher()
        
        
    }
}

struct OpenAICompletionsBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
    let max_tokens: Int
}


struct OpenAICompletionsResponse: Decodable {
    let id: String
    let choices: [OpenAICompletionsChoice]
}

struct OpenAICompletionsChoice: Decodable{
    let text: String
}


import Foundation

struct HelperMessage {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageEmpfänger
    
}

enum MessageEmpfänger {
    case me
    case gpt
}

extension HelperMessage {
    static let sampleMessages = [
        HelperMessage(id: UUID().uuidString, content: "Sample Message From Me", dateCreated: Date(), sender: .me),
        HelperMessage(id: UUID().uuidString, content: "Sample Message From Chat GPT", dateCreated: Date(), sender: .gpt),
        HelperMessage(id: UUID().uuidString, content: "Sample Message From Me", dateCreated: Date(), sender: .me),
        HelperMessage(id: UUID().uuidString, content: "Sample Message From Me", dateCreated: Date(), sender: .gpt)
    ]
}


import SwiftUI
import Combine
// ChatView
struct MyLittleHelperView: View {
    @State var helperMessages: [HelperMessage] = []
    @State var messageText: String = ""
    let openAIService = OpenAIService()
    @State var cancellables  = Set<AnyCancellable>()
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(helperMessages, id: \.id) { message in
                        messageView(message: message)
                    }
                }
            }
            HStack {
                TextField("Gib hier deine Nachricht ein", text: $messageText) {
                    
                }
                    .padding()
                    .background(.gray.opacity(0.45))
                    .cornerRadius(12)
                Button {
                    sendMessage()   // aufruf der function sendMessage
                } label: {
                    Text("Abschicken")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                    
                }
            }
        }
        .padding()
        .background(LinearGradient(colors: [.brown.opacity(0.37), .brown.opacity(0.67)], startPoint: .topLeading, endPoint: .bottomLeading))
        
        
        
    }
        // function über das Verhalten wenn wir fragen oder gpt antwortet
        func messageView(message: HelperMessage) -> some View {
            HStack {
                // Festlegung wo der Text angezeigt werden soll indemfall rechts
                if message.sender == .me {Spacer() }
                Text(message.content)
                    .foregroundColor(message.sender == .me ? .black : .brown)
                    .padding()
                    .background(message.sender == .me ? .brown : .gray.opacity(0.1))
                    .cornerRadius(9)
                // Festlegung wo der Text angezeigt werden soll was ChatGPT antwortet indemfall links
                if message.sender == .gpt {Spacer() }
                
            }
        }
    // Function sendMessage
    func sendMessage() {
        let myMessage = HelperMessage(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .me)
        helperMessages.append(myMessage)
        openAIService.sendMessage(message: messageText).sink { completion
            in
            // Handle error
        } receiveValue: { response in
            guard let textResponse =
                    response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else
            {return}
            let gptMessage = HelperMessage(id: response.id, content: textResponse, dateCreated: Date(), sender: .gpt)
            helperMessages.append(gptMessage)

        }
        .store(in: &cancellables)
        
        messageText = ""
    }
}
    // Preview
    struct MyLittleHelperView_Previews: PreviewProvider {
        static var previews: some View {
            MyLittleHelperView()
        }
    }

