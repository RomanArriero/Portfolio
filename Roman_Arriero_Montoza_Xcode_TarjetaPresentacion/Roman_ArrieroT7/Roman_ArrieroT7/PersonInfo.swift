//
//  PersonInfo.swift
//  Roman_ArrieroT7
//
//  Created by user176695 on 01/11/2020.
//

import SwiftUI

class PersonInfo: ObservableObject {
    
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var job: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var adress: String = ""
}
