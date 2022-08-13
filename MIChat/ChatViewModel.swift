import Foundation
import FirebaseFirestore
import Combine

class ChatViewModel {

    let service: FirebaseService
    
    init(){
        service = FirebaseService()
    }
}
