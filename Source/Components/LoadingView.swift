//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Stephanie Diep on 2021-11-30.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle(tint: .white)
                )
            Text("Loading Board Data")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
