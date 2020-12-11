//
//  FilmStar.swift
//  practiceMVC
//
//  Created by Hy Horng on 9/22/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import Foundation

class FilmStar {
    let name: String
    let description: String
    let profile: String
    
    init(name: String, description: String, profile: String) {
        self.name = name
        self.description = description
        self.profile = profile
    }
    
    func footballers() -> [FilmStar] {
        return [
            FilmStar(name: "Cristiano Ronaldo", description: "Creat player", profile: "ronaldo"),
            FilmStar(name: "Lion Messi", description: "Top player", profile: "messi"),
            FilmStar(name: "Neymar.JR", description: "Nice player", profile: "neymar"),
            FilmStar(name: "Luwandoski", description: "Good player", profile: "luwandoski"),
            FilmStar(name: "M-Salah", description: "Fast player", profile: "salah")
        ]
    }
    
    func singers() -> [FilmStar] {
        return [
            FilmStar(name: "Khemarak Sreymun", description: "Top Singer", profile: "sreymun"),
            FilmStar(name: "Preap Sovath", description: "Nice Singer", profile: "preapSovath"),
            FilmStar(name: "Khem", description: "Best Singer", profile: "khem")
        ]
    }
    
    func modelers() -> [FilmStar] {
        return [
            FilmStar(name: "Romdul Siem Reap", description: "Pretty Girl in Siem Reap", profile: "khmer0"),
            FilmStar(name: "Champey Khampong Cham", description: "Beautiful girl in Khampong Cham", profile: "khmer1"),
            FilmStar(name: "Krovan Battambong", description: "Cute girl in Battambong", profile: "khmer2")
        ]
    }
}
