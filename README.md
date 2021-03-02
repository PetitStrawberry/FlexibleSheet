# FlexibleSheet

Customizable sheet for SwiftUI

## Install

Availabale on Swift Package Manager

## How To Use それっぽいの
``` Swift
@State var sheetState: BottomSheetState = .min

// Setting BottomSheetStyle
// background以外は省略可能 省略した場合はデフォルト値になる
let sheetStyle = BottomSheetStyle(
    // 最小の時の高さ
    minHeight: 100,
    // 省略時はSheetの状態が最小と最大の二通りのみとなる
    midHeight: 300,
    // 最大の時の高さ
    maxHeight: 700,
    // 角丸にするとこ
    corners: .allCorners,
    cornerRadius: 20,
    // Sheetをドラッグした際のアニメーション
    animation: .interactiveSpring(response: 0.5, dampingFraction: 1.0, blendDuration: 1.0),
    // 背景にするView クロージャーで外に出して設定もできる
    background: Color.white
)

var body: some View {
    // Covered View このViewの上にSheetが被さる
    VStack {
        Text("Jamおじさん")
        Text("VS")
        Text("Batter粉さん")
    }
    .bottomSheet(state: $sheetState, style: sheetStyle ) {
        // Sheet contents
        VStack {
            Text("チーz")
            Text("Cover夫")
        }.padding(10)
    }
    .frame(width: .infinity, height: .infinity)
    .edgesIgnoringSafeArea(.all)
}
```

詳細は後ほど書く。それまではソース見てピッピ
