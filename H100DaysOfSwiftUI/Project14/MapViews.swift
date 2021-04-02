//
//  IntegratingMapKit.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/04/21.
//

import MapKit
import SwiftUI

struct MapViews: UIViewRepresentable {
    // Communicating With MapKit Coordinator
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViews
        
        init(_ parent: MapViews) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        // customize the way that marker looks
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIView(context: Context) -> MKMapView  {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let annotation = MKPointAnnotation()
        annotation.title = "Parwanoo"
        annotation.subtitle = "Home"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 30.8524, longitude: 76.9521)
        mapView.addAnnotation(annotation)
        return mapView
    }
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
}

struct MapViews_Previews: PreviewProvider {
    static var previews: some View {
        MapViews()
    }
}
