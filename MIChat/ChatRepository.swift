import Foundation

protocol ChatRepository {
    func getChats() -> [IChat]
    func saveChat(chat: IChat) -> Void
}

class FirebaseChatRepository: ObservableObject, ChatRepository  {

    var firestoreManager: FirestoreManager

    init(){
        firestoreManager = FirestoreManager()
    }
    
    func getChats() -> [IChat] {
        firestoreManager.getChats()
        return firestoreManager.chats
    }

    func saveChat(chat: IChat) {
        firestoreManager.saveChat(chat: chat)
    }
}
