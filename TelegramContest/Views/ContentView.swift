//
//  ContentView.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 21.10.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var model: ViewModel = .init()

    var body: some View {
        VStack(alignment: .leading) {
            if UIImage(data: model.imageData) != nil{
                DrawingScreenView()
                    .environmentObject(model)
            } else {
                AllowAccessView()
                    .environmentObject(model)
            }
        }.KeyboardAwarePadding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct KeyboardAwareModifier: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0

    private var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue }
                .map { $0.cgRectValue.height },
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in CGFloat(0) }
       ).eraseToAnyPublisher()
    }

    func body(content: Content) -> some View {
        content
            .edgesIgnoringSafeArea(.bottom)
            .padding(.bottom, keyboardHeight + 5)
            .onReceive(keyboardHeightPublisher) { self.keyboardHeight = $0 }
    }
}

extension View {
    func KeyboardAwarePadding() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAwareModifier())
    }
}
