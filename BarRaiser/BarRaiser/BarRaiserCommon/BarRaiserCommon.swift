//
//  BarRaiserCommon.swift
//  BarRaiser
//
//  Created by Farooque Azam on 14/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    static var identifier : String {
        return String(describing: self)
    }
}

struct StoryBoardIdentifier {
    static let songDetailIdentifer = "songDetail"
    static let songDetailIStoryBoarddentifer = "BarRaiserSongDetailViewController"
}
