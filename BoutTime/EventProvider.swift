//
//  EventProvider.swift
//  BoutTime
//
//  Created by Annika Noren on 2/20/17.
//  Copyright © 2017 Annika Noren. All rights reserved.
//

import Foundation
import GameKit

struct HistoricalEvents {
    let events: [Event] = [
        Event(event: "Elvis visited Nixon in White House", year: 1970),
        Event(event: "David Bowie introduced Ziggy Stardust", year: 1972),
        Event(event: "Mikhail Baryshnikov defected to USA", year: 1974),
        Event(event: "Apple Computer was formed", year: 1976),
        Event(event: "John Lennon shot to death in NYC", year: 1980),
        Event(event: "Sally Ride became first woman in space", year: 1983),
        Event(event: "Chernobyl nuclear power station exploded", year: 1986),
        Event(event: "Berlin Wall fell", year: 1989),
        Event(event: "American hostage Terry Anderson released", year: 1991),
        Event(event: "Winter Olympics held in Lillehammer", year: 1994),
        Event(event: "Bill Clinton inaugerated for 2nd term", year: 1997),
        Event(event: "JFK, Jr died in plane crash", year: 1999),
        Event(event: "Vermont legalized civil unions for same-sex couples", year: 2000),
        Event(event: "Arnold Schwartenegger elected to Governor of California", year: 2003),
        Event(event: "Hurricane Katrina hit US coasts", year: 2005),
        Event(event: "Senator Obama declared candidacy for POTUS", year: 2007),
        Event(event: "Somali pirates hijack the Maersk Alabama and kidnapped her captain", year: 2009),
        Event(event: "Hurricane Sandy slammed into eastern seaboard", year: 2012),
        Event(event: "Unarmed teenager Michael Brown shot and killed by police in Ferguson, MS", year: 2014),
        Event(event: "Superbowl 50 is played in CA", year: 2016),
        Event(event: "NE Patriots win the Superbowl with greatest comeback ever", year: 2017)
    ]
}

struct Event {
    let event: String
    let year: Int
}
