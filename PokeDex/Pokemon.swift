//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ayan Reza on 8/23/20.
//  Copyright © 2020 Ayan Reza. All rights reserved.
//

import Foundation
struct PokemonList: Codable {
    let results: [Pokemon]
}
struct Pokemon: Codable {
    let name: String
    let url: String
}

struct PokemonData: Codable {
    let id: Int
    let types: [PokemonTypeEntry]
}

struct PokemonType: Codable {
    let name: String
    let url: String
}

struct PokemonTypeEntry: Codable {
    let slot: Int
    let type: PokemonType
}
