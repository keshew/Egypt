import SwiftUI

extension Text {
    func TLHeader(size: CGFloat,
                    color: Color = Color(red: 110/255, green: 75/255, blue: 9/255)) -> some View {
        self.font(.custom("TLheader-Regular", size: size))
            .foregroundColor(color)
    }
}

