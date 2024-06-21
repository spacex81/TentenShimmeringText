import SwiftUI

struct Shimmer: ViewModifier {
    @State private var phase: CGFloat = 0
//    @State private var shimmerWidth: CGFloat = -150
    @State private var shimmerWidth: CGFloat = -50
    
    let shimmerDuration: CGFloat = 0.7

    
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(gradient: Gradient(colors: [.clear, .white.opacity(1.0), .clear]), startPoint: .top, endPoint: .bottom)
                    .rotationEffect(.degrees(70))
                    .offset(x: shimmerWidth)
                    .mask(content)
            )
            .onAppear {
                withAnimation(.linear(duration: shimmerDuration).repeatForever(autoreverses: false)) {
//                    phase = 1
                    shimmerWidth = -shimmerWidth
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
            Text("AAA")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .shimmering()
        }.ignoresSafeArea()
    }
}


#Preview {
    ContentView()
}
