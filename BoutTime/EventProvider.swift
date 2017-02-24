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
        Event(event: "1 Elvis visted Nixon in White House", year: 1970, historicalOrder: 1),
        Event(event: "2 David Bowie introduced Ziggy Stardust", year: 1972, historicalOrder: 2),
        Event(event: "3 Mikhail Baryshnikov defected to USA", year: 1974, historicalOrder: 3),
        Event(event: "4 Apple Computer was formed", year: 1976, historicalOrder: 4),
        Event(event: "5 John Lennon shot to death in NYC", year: 1980, historicalOrder: 5),
        Event(event: "6 Sally Ride becomes first woman in space", year: 1983, historicalOrder: 6),
        Event(event: "7 Chernobyl nuclear power station explodes", year: 1986, historicalOrder: 7),
        Event(event: "8 Berlin Wall falls", year: 1989, historicalOrder: 8),
        Event(event: "9 American hostage Terry Anderson is released", year: 1991, historicalOrder: 9),
        Event(event: "10 Winter Olympics are held in Lillehammer", year: 1994, historicalOrder: 10),
        Event(event: "11 Bill Clinton inaugerated for 2nd term", year: 1997, historicalOrder: 11),
        Event(event: "12 JFK, Jr dies in plane crash", year: 1999, historicalOrder: 12),
        Event(event: "13 Vermont legalizes civil unions for same-sex couples", year: 2000, historicalOrder: 13),
        Event(event: "14 Arnold Schwartenegger elected to Governor of California", year: 2003, historicalOrder: 14),
        Event(event: "15 Hurricane Katrina hits US coasts", year: 2005, historicalOrder: 15),
        Event(event: "16 Senator Obama declares candidacy for POTUS", year: 2007, historicalOrder: 16),
        Event(event: "17 Somali pirates hijack the Maersk Alabama and kidnap her captain", year: 2009, historicalOrder: 17),
        Event(event: "18 Hurrican Sandy slams eastern seaboard", year: 2012, historicalOrder: 18),
        Event(event: "19 Unarmed teenager Michael Brown shot and killed by police in Ferguson, MS", year: 2014, historicalOrder: 19),
        Event(event: "20 Superbowl 50 is played in CA", year: 2016, historicalOrder: 20),
        Event(event: "21 NE Patriots win the Superbowl with greatest comeback ever", year: 2017, historicalOrder: 21)
    ]
}

struct Event {
    let event: String
    let year: Int
    let historicalOrder: Int
}
