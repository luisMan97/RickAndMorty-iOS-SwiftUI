//
//  ApiTool.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 26/04/24.
//

import SystemConfiguration

struct ApiTool {

    static private var reachability: SCNetworkReachability? {
        SCNetworkReachabilityCreateWithName(nil, "www.apple.com")
    }

    static var isConnected: Bool {
        var flags = SCNetworkReachabilityFlags()
        guard let reachability = reachability else {
            return false
        }
        SCNetworkReachabilityGetFlags(reachability, &flags)
        return isNetworkReachable(with: flags)
    }

    static private func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)

        return isReachable && (!needsConnection || canConnectWithoutInteraction)
    }

}
