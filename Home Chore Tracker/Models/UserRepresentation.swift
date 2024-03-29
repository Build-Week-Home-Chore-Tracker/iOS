//
//  UserRepresentation.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct UserRepresentation: Codable {
    let id: UUID
    let familyNameID: String
    let username: String
    let name: String
    let password: String
}
