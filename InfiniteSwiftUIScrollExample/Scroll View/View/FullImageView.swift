//
//  FullImageView.swift
//  InfiniteSwiftUIScrollExample
//
//  Created by Anand Nimje on 23/06/22.
//

import SwiftUI

struct FullImageView: View {
    @GestureState var scale: CGFloat = 1.0
    @State var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .scaleEffect(scale)
            .gesture(MagnificationGesture()
                .updating($scale, body: { (value, scale, trans) in
                    scale = value.magnitude
                })
            )
    }
}

struct FullSizeImageView_Previews: PreviewProvider {
    static var previews: some View {
        FullImageView(image: Image(systemName: "circle"))
    }
}
