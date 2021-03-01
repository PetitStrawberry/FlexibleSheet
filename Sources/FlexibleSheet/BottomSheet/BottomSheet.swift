//
//  FlexibleSheet.swift
//
//
//  Created by プチいちご on 2021/02/12.
//

import SwiftUI

struct BottomSheetView<Content: View, Style: FlexibleSheetStyle>: View {
    @Binding var state: BottomSheetState

    var style: Style
    var content: () -> Content

    var offset: CGFloat {
        switch state {
        case .min:
            return style.maxHeight - style.minHeight
        case .mid:
            return style.maxHeight - style.midHeight
        case .max:
            return 0
        }

    }

    @GestureState var translation = CGSize.zero

    var dragGesture: some Gesture {
        DragGesture().updating($translation) { value, state, _ in
            state = value.translation
        }

        .onEnded { value in
            moveSheet(value: value)

        }
    }

    var position: CGFloat {
        max(offset + translation.height, 0)
    }

    var body: some View {

        GeometryReader { geometry in

            content()
                .frame(width: geometry.size.width, height: style.maxHeight, alignment: .top)
                .background(style.background)
                .cornerRadius(style.cornerRadius, corners: style.corners)
                // .border(Color.green)

                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
                // .border(Color.red)

                .offset(y: position)

                .animation(style.animation, value: position)

                .gesture(dragGesture)
        }
    }

    fileprivate func moveSheet(value: DragGesture.Value) {

        let absTranslationHeight = abs(value.translation.height)
        let positive: Bool = (value.translation.height < 0)
        switch state {
        case .min:
            if style.isHalfMode {
                if positive {
                    if absTranslationHeight >  (style.maxHeight-style.minHeight) * 0.50 {
                        state = .max
                    } else if absTranslationHeight > (style.midHeight-style.minHeight) * 0.25 {
                        state = .mid
                    }
                }
            } else {
                if positive {
                    if absTranslationHeight >  (style.maxHeight-style.minHeight) * 0.25 {
                        state = .max
                    }
                }
            }
        case .mid:
            if style.isHalfMode {
                if positive {
                    if absTranslationHeight >  (style.maxHeight-style.midHeight) * 0.25 {
                        state = .max
                    }
                } else {
                    if absTranslationHeight >  (style.maxHeight-style.midHeight) * 0.25 {
                        state = .min
                    }
                }
            }

        case .max:
            if style.isHalfMode {
                if !positive {
                    if absTranslationHeight >  (style.maxHeight-style.minHeight) * 0.50 {
                        state = .min
                    } else if absTranslationHeight > (style.maxHeight-style.midHeight) * 0.25 {
                        state = .mid
                    }
                }
            } else {
                if !positive {
                    if absTranslationHeight >  (style.maxHeight-style.minHeight) * 0.25 {
                        state = .min
                    }
                }
            }
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var style  = BottomSheetStyle(
        minHeight: 100,
        midHeight: 200,
        maxHeight: 400,
        cornerRadius: 30
    ) {
        Color.white
    }

    static var previews: some View {
        VStack {
            Text("Test").foregroundColor(.white)
            Spacer()
        }
        .background(Color.black.scaledToFill())
        .bottomSheet(state: .constant(BottomSheetState.mid), style: style) {
            VStack {
                Text("それいけ！")
                Divider()
                Text("Jamおじさん").font(.largeTitle)
            }.padding(10)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BottomSheet<SheetContent: View, Style: FlexibleSheetStyle>: ViewModifier {

    @Binding var state: BottomSheetState
    var style: Style
    var sheetContent: () -> SheetContent

    func body(content: Content) -> some View {

        ZStack {
            GeometryReader { geometry in
                content.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
            BottomSheetView(state: $state, style: style) {
                sheetContent()
            }
        }
    }
}

public extension View {
    func bottomSheet<Content: View, Style: FlexibleSheetStyle> (state: Binding<BottomSheetState>, style: Style, content: @escaping () -> Content) -> some View {
        self.modifier(BottomSheet(state: state, style: style ) {
            content()
        }
        )
    }
}
