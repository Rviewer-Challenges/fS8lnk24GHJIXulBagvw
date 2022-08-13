import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase

struct User {
    let name: String
    let date: String
    let message: String
}

class FirebaseService {

    var user: Any!
    var ref: DatabaseReference!

    init() {
        ref = Database.database().reference()
        ref.child("chats").getData(completion:  { error, snapshot in
//          guard error == nil else {
//            print(error!.localizedDescription)
//            return;
//          }
            print(snapshot?.value ?? "kfajdsflkajsd")
            self.user = snapshot?.value
        });
    }
}
