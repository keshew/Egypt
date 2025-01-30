import SwiftUI

struct RectangleButton: View {
    var geometry: GeometryProxy
    var text: String
    var textSize: CGFloat = 40
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.buttonBackground)
                    .resizable()
                    .frame(width: geometry.size.width * 0.203,
                           height: geometry.size.height * 0.283)
                
                Text(text)
                    .TLHeader(size: textSize)
            }
        }
    }
}

struct StoneButton: View {
    var foregroundImage: String
    var sizeForegroundImage: CGFloat
    var sizeXBackground: CGFloat
    var sizeYBackground: CGFloat
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.rectangleStoneBackgroundButton)
                    .resizable()
                    .frame(width: sizeXBackground, height: sizeYBackground)
                
                Image(foregroundImage)
                    .resizable()
                    .frame(width: sizeForegroundImage, height: sizeForegroundImage)
            }
        }
    }
}

struct LockedLevel: View {
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.lockedLevelBackground)
                .resizable()
                .frame(width: geometry.size.width * 0.116,
                       height: geometry.size.height * 0.18)
            
            Image(.locked)
                .resizable()
                .frame(width: geometry.size.width * 0.044,
                       height: geometry.size.height * 0.087)
        }
    }
}

struct OpenLevel: View {
    var text: String
    var geometry: GeometryProxy
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.openLevelBackground)
                    .resizable()
                    .frame(width: geometry.size.width * 0.116,
                           height: geometry.size.height * 0.18)
               
                Text(text)
                    .TLHeader(size: 40)
            }
        }
    }
}

struct CustomSlider: View {
    @Binding var value: Float
    let range: ClosedRange<Float>
    let thumbSize: CGFloat = 20
    let secindThumbSize: CGFloat = 11
    let trackHeight: CGFloat = 15
    let sizeSlider: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(red: 109/255, green: 75/255, blue: 9/255))
                    .frame(height: trackHeight)
                    .cornerRadius(8)

                ZStack {
                    Circle()
                        .fill(.black)
                        .frame(width: thumbSize, height: thumbSize)

                    Circle()
                        .fill(.white)
                        .frame(width: secindThumbSize, height: secindThumbSize)
                        .offset(x: 3, y: -3)
                }
                .offset(x: CGFloat(normalizedValue) * (geometry.size.width - thumbSize))
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            updateValue(with: gesture.location.x, in: geometry.size.width)
                        }
                )
            }
        }
        .frame(width: sizeSlider, height: thumbSize)
    }

    private var normalizedValue: Float {
        return (value - range.lowerBound) / (range.upperBound - range.lowerBound)
    }

    private func updateValue(with locationX: CGFloat, in totalWidth: CGFloat) {
        let newValue = Float((locationX / totalWidth)) * (range.upperBound - range.lowerBound) + range.lowerBound
        value = min(max(newValue, range.lowerBound), range.upperBound)
    }
}
