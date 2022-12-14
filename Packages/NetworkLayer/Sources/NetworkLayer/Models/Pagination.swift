//
// Pagination.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Pagination: Codable, JSONEncodable, Hashable {

    public var limit: Int?
    public var offset: Int?
    public var count: Int?
    public var total: Int?

    public init(limit: Int? = nil, offset: Int? = nil, count: Int? = nil, total: Int? = nil) {
        self.limit = limit
        self.offset = offset
        self.count = count
        self.total = total
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case limit
        case offset
        case count
        case total
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(offset, forKey: .offset)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(total, forKey: .total)
    }
}

