import Foundation

// MARK: - ProfileDataModel
struct ProfileDataModel: Codable {
    let status: Int
    let message: String
    let data: ProfileData
}

// MARK: - DataClass
struct ProfileData: Codable {
    let user: UserPofileData

    enum CodingKeys: String, CodingKey {
        case user = "User"
    }
}

// MARK: - User
struct UserPofileData: Codable {
    let id: Int
    let role, firstname, lastname, email: String
    let phone, gender: String
    let about: JSONNull?
    let image: String
    let deviceID, deviceToken, deviceType: String
    let customerStripeID: JSONNull?
    let status, stripeAcoountCode, stripeResponse: String
    let accountVerification: Int
    let athleteDetail: AthleteDetail
    let athleteSport: [AthleteSport]
    let athleteIndustry: [AthleteIndustry]
    let athletePayRange: [AthletePayRange]
    let athleteActivity: [UserActivity]
    let athleteSocialDetail: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, role, firstname, lastname, email, phone, gender, about, image
        case deviceID = "device_id"
        case deviceToken = "device_token"
        case deviceType = "device_type"
        case customerStripeID = "customer_stripe_id"
        case status
        case stripeAcoountCode = "stripe_acoount_code"
        case stripeResponse = "stripe_response"
        case accountVerification = "account_verification"
        case athleteDetail = "athlete_detail"
        case athleteSport = "athlete_sport"
        case athleteIndustry = "athlete_industry"
        case athletePayRange = "athlete_pay_range"
        case athleteActivity = "athlete_activity"
        case athleteSocialDetail = "athlete_social_detail"
    }
}

// MARK: - AthleteActivity
struct UserActivity: Codable {
    let id, athleteID, activityID: Int
    let activity: Activity

    enum CodingKeys: String, CodingKey {
        case id
        case athleteID = "athlete_id"
        case activityID = "activity_id"
        case activity
    }
}

// MARK: - Activity
struct Activity: Codable {
    let id: Int
    let name: String
    let image: String
}

// MARK: - AthleteDetail
struct AthleteDetail: Codable {
    let id, userID: Int
    let dob: String
    let schoolID, stateID, cityID, pinCode: Int
    let school: School

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case dob
        case schoolID = "school_id"
        case stateID = "state_id"
        case cityID = "city_id"
        case pinCode = "pin_code"
        case school
    }
}

// MARK: - School
struct School: Codable {
    let id: Int
    let name: String
}

// MARK: - AthleteIndustry
struct AthleteIndustry: Codable {
    let id, athleteID, industryID: Int
    let industry: Activity

    enum CodingKeys: String, CodingKey {
        case id
        case athleteID = "athlete_id"
        case industryID = "industry_id"
        case industry
    }
}

// MARK: - AthletePayRange
struct AthletePayRange: Codable {
    let id, athleteID, payRangeID: Int
    let payRange: PayRange

    enum CodingKeys: String, CodingKey {
        case id
        case athleteID = "athlete_id"
        case payRangeID = "pay_range_id"
        case payRange = "pay_range"
    }
}

// MARK: - PayRange
struct PayRange: Codable {
    let id: Int
    let payRange: String

    enum CodingKeys: String, CodingKey {
        case id
        case payRange = "pay_range"
    }
}

// MARK: - AthleteSport
struct AthleteSport: Codable {
    let id, athleteID, athleteCategoryID: Int
    let athleteCategory: Activity

    enum CodingKeys: String, CodingKey {
        case id
        case athleteID = "athlete_id"
        case athleteCategoryID = "athlete_category_id"
        case athleteCategory = "athlete_category"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

