

import Foundation

struct HomeModel {
    var characters:[CharacterModel]?
    var nextCharacterUrl:String?
}

struct RequestModel<T:Codable>:Codable {
    let info:RequestInfo?
    let results:[T]?
}

struct RequestInfo:Codable {
    let count:Int?
    let pages:Int?
    let next:String?
    let prev:String?
}

struct CharacterModel:Codable {
    let id:Int?
    let name:String?
    let status:String?
    let species:String?
    let type:String?
    let gender:String?
    let image:String?
    let url:String?
    let origin:LocationModel?
    let location:LocationModel?
    let episode:[String]?
    var isFavorited:Bool?
    
}

struct LocationModel:Codable {
    let id:Int?
    let name:String?
    let url:String?
    let type:String?
    let dimension:String?
    let residents:[String]?
}

struct EpisodeModel:Codable {
    let id:Int?
    let name:String?
    let air_date:String?
    let episode:String?
    let characters:[String]?
    let url:String?
}
