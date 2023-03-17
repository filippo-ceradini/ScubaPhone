//
//  EventTimer.swift
//

import Foundation

internal final class EventTimer {
    
    private var source: DispatchSourceTimer
    
    init() {
        source = DispatchSource.makeTimerSource()
        source.activate()
    }
    
    func scheduleEvent(fromNow: Double, onTimeout: @escaping ()->(), onCancel: (()->())?) {
        if source.isCancelled {
            source = DispatchSource.makeTimerSource()
            source.activate()
        }
        
        source.suspend()
        source.setEventHandler(handler: onTimeout)
        source.setCancelHandler(handler: onCancel)
        source.schedule(deadline: DispatchTime.now() + fromNow)
        source.resume()
    }
    
    func cancel() {
        source.cancel()
    }
    
}
