import SwiftUI

struct Shimmer: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(gradient: Gradient(colors: [.clear, .white.opacity(1.0), .clear]), startPoint: .top, endPoint: .bottom)
                    .rotationEffect(.degrees(70))
                    .offset(x: phase * 300 - 150)
                    .mask(content)
            )
            .onAppear {
                withAnimation(Animation.linear(duration: 1.3).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
    }
}

extension View {
    func shimmering() -> some View {
        self.modifier(Shimmer())
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            Text("Shimmering Text")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .shimmering()  // Apply the shimmering modifier here
        }.ignoresSafeArea()
    }
}


#Preview {
    ContentView()
}
