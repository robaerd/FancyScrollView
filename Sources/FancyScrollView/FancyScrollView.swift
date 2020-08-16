import SwiftUI

public struct FancyScrollView: View {
    let title: String
    let headerHeight: CGFloat
    let scrollUpHeaderBehavior: ScrollUpHeaderBehavior
    let scrollDownHeaderBehavior: ScrollDownHeaderBehavior
    let header: AnyView?
    let button: AnyView?
    let buttonTitle: AnyView?
    let content: AnyView

    public var body: some View {
        if let header = header {
            return AnyView(
                HeaderScrollView(title: title,
                                 headerHeight: headerHeight,
                                 scrollUpBehavior: scrollUpHeaderBehavior,
                                 scrollDownBehavior: scrollDownHeaderBehavior,
                                 header: header,
                                 button: button,
                                 buttonTitle: buttonTitle,
                                 content: content)
            )
        } else {
            return AnyView(
                AppleMusicStyleScrollView {
                    VStack {
                        title != "" ? HStack {
                            Text(title)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .fontWeight(.black)
                                .padding(.horizontal, 16)

                            Spacer()
                        } : nil

                        title != "" ? Spacer() : nil

                        content
                    }
                }
            )
        }
    }
}

extension FancyScrollView {

    public init<A: View, B: View, C: View, D: View>(title: String = "",
                                  headerHeight: CGFloat = 300,
                                  scrollUpHeaderBehavior: ScrollUpHeaderBehavior = .parallax,
                                  scrollDownHeaderBehavior: ScrollDownHeaderBehavior = .offset,
                                  header: () -> A?,
                                  button: () -> B?,
                                  buttonTitle: () -> C?,
                                  content: () -> D) {

        self.init(title: title,
                  headerHeight: headerHeight,
                  scrollUpHeaderBehavior: scrollUpHeaderBehavior,
                  scrollDownHeaderBehavior: scrollDownHeaderBehavior,
                  header: AnyView(header()),
                  button: AnyView(button()),
                  buttonTitle: AnyView(buttonTitle()),
                  content: AnyView(content()))
    }

    public init<A: View>(title: String = "",
                         headerHeight: CGFloat = 300,
                         scrollUpHeaderBehavior: ScrollUpHeaderBehavior = .parallax,
                         scrollDownHeaderBehavior: ScrollDownHeaderBehavior = .offset,
                         content: () -> A) {

           self.init(title: title,
                     headerHeight: headerHeight,
                     scrollUpHeaderBehavior: scrollUpHeaderBehavior,
                     scrollDownHeaderBehavior: scrollDownHeaderBehavior,
                     header: nil,
                     button: nil,
                     buttonTitle: nil,
                     content: AnyView(content()))
       }

}
