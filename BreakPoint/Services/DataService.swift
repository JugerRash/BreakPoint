//
//  DataService.swift
//  BreakPoint
//
//  Created by juger rash on 08.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let DB_BASE = Database.database().reference()//this is a reference to datatbase in firebase and we make it globel cuz we want it to accessable from every class

class DataService {
    static let instance  = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users") // variable to all our users
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    // and now we will create public variables to use the private variables and change the values
    var REF_BASE : DatabaseReference {
        return _REF_BASE
    }
    var REF_USERS : DatabaseReference {
        return _REF_USERS
    }
    var REF_GROUPS : DatabaseReference {
        return _REF_GROUPS
    }
    var REF_FEED : DatabaseReference {
        return _REF_FEED
    }
    
    //Functions -:
    //first of all creating a user 
    func createDBUser(uid : String , userData : Dictionary<String , Any>) {
        REF_USERS.child(uid).updateChildValues(userData) // with this we create a new user with his data :)
    }
    
    func getUsername(forUID uid : String , handler : @escaping  (_ userName : String) -> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (DataSnapshot) in
            guard let dataSnapshot = DataSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            for user in dataSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func uploadPost(withMessage message : String ,andUID uid : String , andGroupKey groupKey : String? , uploadComplete : @escaping (_ status : Bool) -> ()){
        if groupKey != nil {
            //send it to a specific group
        }else {
            REF_FEED.childByAutoId().updateChildValues(["content" : message , "senderId" : uid])
            uploadComplete(true)
        }
    }
    
    func getAllFeedMessages(messageHandler : @escaping (_ messages : [Message]) -> ()){
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value) { (DataSnapshot) in
            guard let feedMessageSnapshot = DataSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let newMessage = Message(content: content, senderId: senderId)
                messageArray.append(newMessage)
            }
            messageHandler(messageArray)
            
        }
    }
    
    func getEmails(forSearchQuery query:String , handler : @escaping (_ emailArray : [String]) -> () ){
        var emailArray = [String]()
        REF_USERS.observe(.value) { (usersDataSnapshot) in
            guard let usersDataSnapshot = usersDataSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in usersDataSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                if email.contains(query) && email != Auth.auth().currentUser?.email {
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
    }
    
}
