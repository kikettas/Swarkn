//
//  NSBundle.swift
//
//  Created by kikettas on 12/7/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation


extension Bundle {
    public var releaseVersionNumber: String? {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public var buildVersionNumber: String? {
        return self.infoDictionary?["CFBundleVersion"] as? String
    }
}
