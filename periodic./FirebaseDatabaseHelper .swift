//
//  FirebaseDatabaseHelper .swift
//  periodic.
//
//  Created by Anika Bagga on 11/3/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage


class FirebaseDatabaseHelper {
    var ref: DatabaseReference!
    var postsRef: DatabaseReference!

    init(){
        ref = Database.database().reference()
        postsRef = Database.database().reference()
    }
    
    static func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }

    func newPost(name: String, aboutYou: String, itemsRequested: [String], completion: @escaping ()->()){
        let posterId = getCurrentUser()?.uid
        let postsRef = Database.database().reference().child("Posts")
        let newPost = ["name": name, "aboutYou": aboutYou, "itemsRequested": itemsRequested]
        let key = postsRef.childByAutoId().key
        let childUpdates = ["/\(key)/": newPost]
        postsRef.updateChildValues(childUpdates)
        print("Post created!")
        completion()
    }

    static func fetchPosts(withBlock: @escaping ([Post]) -> ()){
        postsRef.child("Posts").observe(.childAdded, with: { (snapshot) in
            let post = Post(id: snapshot.key, postDict: snapshot.value as! [String : Any]?)
            withBlock([post])
        })
    }

    func makeUser(user: User){
        self.ref.child("users").child(user.uid).setValue(user.dictValue)
    }
    
    func getUserWithId(id: String, withBlock: @escaping (User) -> ()) {
        let usersRef = Database.database().reference().child("User")
        usersRef.child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let user = User(id, (value?["firstName"] as? String)!, (value?["phoneNumber"] as? String)!, (value?["email"] as? String)!, (value?["isDonor"] as? Bool)!)
            withBlock(user)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
