//
//  APOD.swift
//  SpaceIsCool
//
//  Created by Matt Marose on 8/9/19.
//  Copyright © 2019 Matt Marose. All rights reserved.
//

import Foundation

struct APOD: Codable {
    let copyright : String?
    let date: String?
    let explanation: String?
    let hdurl: String?
    let mediaType: String?
    let serviceVersion: String?
    let title: String?
    let url: String?
}
