//
//  Parent.swift
//  AccordionTableSwift
//
//  Created by Victor Sigler on 3/5/16.
//  Copyright © 2016 Pentlab. All rights reserved.
//

import Foundation
import SwiftyJSON


/**
 Define the state of a cell
 
 - Collapsed: Cell collapsed
 - Expanded:  Cell expanded
 */
enum State {
    case Collapsed
    case Expanded
}

/**
 Enum to define the number of cell expanded at time
 
 - One:     One cell expanded at time.
 - Several: Several cells expanded at time.
 */
enum NumberOfCellExpanded {
    case One
    case Several
}

/**
 *  The Parent struct of the data source.
 */
struct Parent {
    
    /// State of the cell
    var state: State
    
    /// The childs of the cell
    var childs: [JSON]
    
    /// The title for the cell.
    var parentData: JSON

}

/**
 Overload for the operator != for tuples
 
 - parameter lhs: The first tuple to compare
 - parameter rhs: The seconde tuple to compare
 
 - returns: true if there are different, otherwise false
 */
