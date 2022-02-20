//
//  Dictionary+KKUtils.swift
//  KokteylUtils
//
//  Created by Mehmet Karagöz on 18.02.2022.
//  Copyright © 2022 Kokteyl.
//

import UIKit

extension Dictionary {
    var queryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
}
