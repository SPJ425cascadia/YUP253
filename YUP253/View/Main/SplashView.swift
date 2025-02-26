//
//  LaunchView.swift
//  SwiftUI-03-InteractiveControls
//
//  Created by Stephen Gomez-Fox on 5/2/21.
//

import SwiftUI

class SplashViewState {
    var message : String = ""
    var status: Int16 = 0
    var error: Bool = false
    var finished: Bool = false
}

struct SplashView: View {
    
    @State private var message : String = ""
    @State private var dismiss : Bool = false
    
    var body: some View {
        if self.dismiss {
            ContentView()
        } else  {
            VStack {
                Spacer(minLength: 0)
                Text($message.wrappedValue)
                    .foregroundColor(Color.white)
                    .scaledToFill()
            }
            .background(
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .padding(-66)
            )
            .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    withAnimation {
                        self.message = "Looking for upcoming events"
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.00) {
                        self.message = "Getting the latest highlights"
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.00) {
                        self.message = "Updating your feed"
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                    self.dismiss = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
