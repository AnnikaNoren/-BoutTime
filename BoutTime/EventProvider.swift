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
        Event(event: "Elvis visited Nixon in White House", year: 1970, url: "https://en.wikipedia.org/wiki/Elvis_Presley"),
        Event(event: "David Bowie introduced Ziggy Stardust", year: 1972, url: "https://en.wikipedia.org/wiki/David_Bowie"),
        Event(event: "Mikhail Baryshnikov defected to USA", year: 1974, url: "https://en.wikipedia.org/wiki/Mikhail_Baryshnikov"),
        Event(event: "Apple Computer was formed", year: 1976, url: "https://en.wikipedia.org/wiki/Apple_Inc"),
        Event(event: "John Lennon shot to death in NYC", year: 1980, url: "https://en.wikipedia.org/wiki/John_Lennon"),
        Event(event: "Sally Ride became first woman in space", year: 1983, url: "https://en.wikipedia.org/wiki/Sally_Ride"),
        Event(event: "Chernobyl nuclear power station exploded", year: 1986, url: "https://en.wikipedia.org/wiki/Chernobyl_disaster"),
        Event(event: "Berlin Wall fell", year: 1989, url: "https://en.wikipedia.org/wiki/Berlin_Wall"),
        Event(event: "American hostage Terry Anderson released", year: 1991, url: "https://en.wikipedia.org/wiki/Terry_A._Anderson"),
        Event(event: "Winter Olympics held in Lillehammer", year: 1994, url: "https://en.wikipedia.org/wiki/1994_Winter_Olympics"),
        Event(event: "Bill Clinton inaugerated for 2nd term", year: 1997, url: "https://en.wikipedia.org/wiki/Presidency_of_Bill_Clinton"),
        Event(event: "JFK, Jr died in plane crash", year: 1999, url: "https://en.wikipedia.org/wiki/John_F._Kennedy_Jr"),
        Event(event: "Vermont legalized civil unions for same-sex couples", year: 2000, url: "https://en.wikipedia.org/wiki/LGBT_rights_in_Vermont"),
        Event(event: "Arnold Schwartenegger elected to Governor of California", year: 2003, url: "https://en.wikipedia.org/wiki/Arnold_Schwarzenegger"),
        Event(event: "Hurricane Katrina hit US coasts", year: 2005, url: "https://en.wikipedia.org/wiki/Hurricane_Katrina"),
        Event(event: "Senator Obama declared candidacy for POTUS", year: 2007, url: "https://en.wikipedia.org/wiki/Barack_Obama"),
        Event(event: "Somali pirates hijacked the Maersk Alabama and kidnapped her captain", year: 2009, url: "https://en.wikipedia.org/wiki/Maersk_Alabama_hijacking"),
        Event(event: "Hurricane Sandy slammed into eastern seaboard", year: 2012, url: "https://en.wikipedia.org/wiki/Hurricane_Sandy"),
        Event(event: "Unarmed teenager Michael Brown killed by police in Ferguson, MS", year: 2014, url: "https://en.wikipedia.org/wiki/Shooting_of_Michael_Brown"),
        Event(event: "Superbowl 50 was played in CA", year: 2016, url: "https://en.wikipedia.org/wiki/Super_Bowl_50"),
        Event(event: "NE Patriots won the Superbowl with greatest comeback ever", year: 2017, url: "https://en.wikipedia.org/wiki/Super_Bowl_LI")
    ]
}

