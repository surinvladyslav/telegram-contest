//
//  AllowAccess.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 27.10.2022.
//

import SwiftUI
import PhotosUI

struct AllowAccessView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                LottieView(animationName: "duck",
                      loopMode: .loop,
                      contentMode: .scaleAspectFit)
                    .padding(.bottom)
                    .frame(width: 160, height: 160)
                Text("Access Your Photos and Videos")
                    .font(.system(size: 20, weight: .medium))
                    .padding(.bottom)
                Button(action: {
                    model.showPicker.toggle()
                }) {
                    Text("Allow Access")
                        .font(.system(size: 17, weight: .medium))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(.white)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 15)
                .padding(.bottom, 15)
                .background(.blue)
                .cornerRadius(10)
            }
            .sheet(isPresented: $model.showPicker) {
//                if let image = UIImage(data: model.imageData){
//                    model.addImageToStack(image: image)
//                }
            } content: {
                PickerTool(showPicker: $model.showPicker, imageData: $model.imageData)
            }
//            .sheet(isPresented: $model.showPicker) {
//                PickerTool(showPicker: $model.showPicker, imageData: $model.imageData)
//            }
        }
    }
}

struct AllowAccess_Previews: PreviewProvider {
    static var previews: some View {
        AllowAccessView()
    }
}

