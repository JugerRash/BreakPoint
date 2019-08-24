//
//  Group.swift
//  BreakPoint
//
//  Created by juger rash on 19.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import Foundation

class Group {
    //Variables -:
    private var _groupTitle : String
    private var _groupDesc : String
    private var _groupKey : String
    private var _groupMembers : [String]
    private var _groupMembersCount : Int
    
    var groupTitle : String {
        return _groupTitle
    }
    var groupDesc : String {
        return _groupDesc
    }
    var groupKey : String {
        return _groupKey
    }
    var groupMembers : [String] {
        return _groupMembers
    }
    var groupMembersCount : Int {
        return _groupMembersCount
    }
    
    init(title : String , description : String , key : String , members : [String] , membersCount : Int) {
        self._groupTitle = title
        self._groupDesc = description
        self._groupKey = key
        self._groupMembers = members
        self._groupMembersCount = membersCount
    }
}
