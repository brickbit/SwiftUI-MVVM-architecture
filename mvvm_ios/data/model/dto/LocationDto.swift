//
//  LocationDto.swift
//  mvvm_ios
//
//  Created by Roberto Garcia Romero on 15/4/24.
//

struct LocationDto: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}

extension LocationDto {
    func toBo() -> LocationBo {
        return LocationBo(
            id: id,
            name: name,
            type: type,
            dimension: dimension,
            residents: residents,
            url: url,
            created: created
        )
    }
}
