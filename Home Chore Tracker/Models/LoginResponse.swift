//
//  LoginResponse.swift
//  Home Chore Tracker
//
//  Created by Ciara Beitel on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let token: String
    let user: Int
}
