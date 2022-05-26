//
//  RequestBuilder.swift
//  StarWars
//
//  Created by Oshitha on 5/25/22.
//

import Foundation
import Alamofire

protocol RequestBuilder {
    var baseUrl: String {get}
    var service: String {get}
}
