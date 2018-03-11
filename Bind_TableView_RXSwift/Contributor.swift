//
//  Contributor.swift
//  Bind_TableView_RXSwift
//
//  Created by Andres Felipe Ocampo Eljaiesk on 10/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import UIKit

struct Contributor {
    
    let name : String?
    let gitHubID : String?
    var image : UIImage?
    
    
    init(pName : String, pGitHubID : String) {
        self.name = pName
        self.gitHubID = pGitHubID
        self.image = UIImage(named: pGitHubID)
    }
}

extension Contributor : CustomStringConvertible{
    var description: String {
        return "\(String(describing: self.name!)): github.com/\(String(describing: self.gitHubID!))"
    }
}
