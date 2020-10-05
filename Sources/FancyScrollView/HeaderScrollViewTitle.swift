import SwiftUI

struct HeaderScrollViewTitle: View {
    let title: String
    let headerTitleColor: Binding<Color>?
    let height: CGFloat
    let largeTitle: Double
    let button: AnyView?
    
    var body: some View {
        let largeTitleOpacity = (max(largeTitle, 0.5) - 0.5) * 2
        let tinyTitleOpacity = 1 - min(largeTitle, 0.5) * 2
        return ZStack {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .padding(.horizontal, 16)
                    .offset(y: -4)
                
                Spacer()
            }
            .padding(.top, 8)
            .background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color(white: 0.0, opacity: 0.3)]), startPoint: .top, endPoint: .bottom))
            .opacity(sqrt(largeTitleOpacity))
            
            ZStack {
                HStack {
                    BackButton(color: .primary)
                    Spacer()
                    self.button
                }
                HStack {
                    Text(title)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
            }
            .padding(.bottom, (height - 18) / 2)
            .opacity(sqrt(tinyTitleOpacity))
        }.frame(height: height)
    }
}
