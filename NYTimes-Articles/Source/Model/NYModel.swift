//
//  NYModel.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

// MARK: - NYModel
struct NYModel: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
        
    }
    
}

// MARK: - Result
struct Result: Codable {
    let url: String
    let adxKeywords: String
    let column: String?
    let section, byline: String
    let type: ResultType
    let title, abstract, publishedDate: String
    let source: Source
    let id, assetID, views: Int
    let desFacet: [String]
    let orgFacet, perFacet, geoFacet: [String]
    let media: [Media]

//    enum CodingKeys: String, CodingKey {
//        case url
//        case adxKeywords = "adx_keywords"
//        case column, section, byline, type, title, abstract
//        case publishedDate = "published_date"
//        case source, id
//        case assetID = "asset_id"
//        case views
//        case desFacet = "des_facet"
//        case orgFacet = "org_facet"
//        case perFacet = "per_facet"
//        case geoFacet = "geo_facet"
//        case media
//    }
    
}

// MARK: - Media
struct Media: Codable {
    let type: MediaType
    let subtype: Subtype
    let caption, copyright: String?
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
        
    }
    
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
    let format: Format
    let height, width: Int
    
}

enum Format: String, Codable {
    case jumbo = "Jumbo"
    case large = "Large"
    case largeThumbnail = "Large Thumbnail"
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case normal = "Normal"
    case square320 = "square320"
    case square640 = "square640"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
    
}

enum Subtype: String, Codable {
    case photo = "photo"
    
}

enum MediaType: String, Codable {
    case image = "image"
    
}

enum Source: String, Codable {
    case theNewYorkTimes = "The New York Times"
    
}

enum ResultType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
    
}

