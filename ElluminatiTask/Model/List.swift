/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct List : Codable {
	let _id : String?
	let name : [String]?
	let price : Int?
    var sequence_number : Int?
    var is_default_selected : Bool?
	let specification_group_id : String?
	let unique_id : Int?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case name = "name"
		case price = "price"
		case sequence_number = "sequence_number"
		case is_default_selected = "is_default_selected"
		case specification_group_id = "specification_group_id"
		case unique_id = "unique_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		name = try values.decodeIfPresent([String].self, forKey: .name)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
		sequence_number = try values.decodeIfPresent(Int.self, forKey: .sequence_number)
		is_default_selected = try values.decodeIfPresent(Bool.self, forKey: .is_default_selected)
		specification_group_id = try values.decodeIfPresent(String.self, forKey: .specification_group_id)
		unique_id = try values.decodeIfPresent(Int.self, forKey: .unique_id)
	}

}
