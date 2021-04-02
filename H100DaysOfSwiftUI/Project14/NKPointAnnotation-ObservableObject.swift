//
//  NKPointAnnotation-ObservableObject.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/04/21.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Example location"
        }
        set {
            title = newValue
        }
    }
    public var wrappedSubtitle:String {
        get {
            self.subtitle ?? "Example Description"
        }
        
        set {
            subtitle = newValue
        }
    }
}
