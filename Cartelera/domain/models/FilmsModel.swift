//
//  FilmModel.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//

import Foundation

// MARK: - FilmsModel
struct FilmsModel: Codable {
    let films: [Film]
    let status: FilmsStatus
}

// MARK: - FilmsFilm
struct Film: Codable {
    let filmID, imdbID: Int
    let imdbTitleID, filmName: String
    let otherTitles: FilmsOtherTitles?
    let releaseDates: [FilmsReleaseDate]
    let ageRating: [FilmsAgeRating]
    let filmTrailer: String?
    let synopsisLong: String
    let images: FilmsImages

    enum CodingKeys: String, CodingKey {
        case filmID = "film_id"
        case imdbID = "imdb_id"
        case imdbTitleID = "imdb_title_id"
        case filmName = "film_name"
        case otherTitles = "other_titles"
        case releaseDates = "release_dates"
        case ageRating = "age_rating"
        case filmTrailer = "film_trailer"
        case synopsisLong = "synopsis_long"
        case images
    }
}

// MARK: - FilmsAgeRating
struct FilmsAgeRating: Codable {
    let rating: String
    let ageRatingImage: String
    let ageAdvisory: String

    enum CodingKeys: String, CodingKey {
        case rating
        case ageRatingImage = "age_rating_image"
        case ageAdvisory = "age_advisory"
    }
}

// MARK: - FilmsImages
struct FilmsImages: Codable {
    let poster: FilmsPoster
    let still: FilmsStill?
}

// MARK: - FilmsPoster
struct FilmsPoster: Codable {
    let the1: FilmsPoster1

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
    }
}

// MARK: - FilmsPoster1
struct FilmsPoster1: Codable {
    let imageOrientation: FilmsImageOrientation
    let region: FilmsRegion
    let medium: FilmsMedium

    enum CodingKeys: String, CodingKey {
        case imageOrientation = "image_orientation"
        case region, medium
    }
}

enum FilmsImageOrientation: String, Codable {
    case portrait = "portrait"
}

// MARK: - FilmsMedium
struct FilmsMedium: Codable {
    let filmImage: String
    let width, height: Int

    enum CodingKeys: String, CodingKey {
        case filmImage = "film_image"
        case width, height
    }
}

enum FilmsRegion: String, Codable {
    case global = "global"
    case uk = "UK"
}

// MARK: - FilmsStill
struct FilmsStill: Codable {
    let the1: FilmsStill1

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
    }
}

// MARK: - FilmsStill1
struct FilmsStill1: Codable {
    let imageOrientation: String
    let medium: FilmsMedium

    enum CodingKeys: String, CodingKey {
        case imageOrientation = "image_orientation"
        case medium
    }
}

// MARK: - FilmsOtherTitles
struct FilmsOtherTitles: Codable {
    let en: String

    enum CodingKeys: String, CodingKey {
        case en = "EN"
    }
}

// MARK: - FilmsReleaseDate
struct FilmsReleaseDate: Codable {
    let releaseDate: String
    let notes: FilmsNotes

    enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"
        case notes
    }
}

enum FilmsNotes: String, Codable {
    case xxx = "XXX"
}

// MARK: - FilmsStatus
struct FilmsStatus: Codable {
    let count: Int
    let state, method: String
    let message: String?
    let requestMethod, version, territory, deviceDatetimeSent: String
    let deviceDatetimeUsed: String

    enum CodingKeys: String, CodingKey {
        case count, state, method, message
        case requestMethod = "request_method"
        case version, territory
        case deviceDatetimeSent = "device_datetime_sent"
        case deviceDatetimeUsed = "device_datetime_used"
    }
}
