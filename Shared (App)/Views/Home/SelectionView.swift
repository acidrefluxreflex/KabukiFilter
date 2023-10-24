//
//  SelectionView.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import SwiftUI

struct ItemSelectionView: View {

    // 選択された項目を格納する配列
    @State private var selectedItems: [String] = []

    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    var body: some View {
        VStack {
            Text("Select two items")
                .font(.title)
                .padding()

            // 項目のリストを表示
            List(items, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()

                    // 選択された項目を追跡するチェックボックス
                    if selectedItems.contains(item) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .onTapGesture {
                    selectItem(item)
                }
            }
            .listStyle(.plain)
            .padding()

            // 選択された項目を表示
            if !selectedItems.isEmpty {
                Text("Selected items:")
                    .font(.title2)
                    .padding()

                ForEach(selectedItems, id: \.self) { item in
                    Text(item)
                        .padding()
                }
            }

            // 次のビューに移行するためのナビゲーションリンク
            NavigationLink(
                destination: NextView(),
                label: {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(selectedItems.count == 2 ? Color.blue : Color.gray)
                        .cornerRadius(8)
                }
            )
            .disabled(selectedItems.count != 2)
            .padding()

            Spacer()
        }
    }

    // 項目を選択する関数
    private func selectItem(_ item: String) {
        if let index = selectedItems.firstIndex(of: item) {
            selectedItems.remove(at: index)
        } else {
            selectedItems.append(item)
        }
    }
}

// 次のビュー
struct NextView: View {
    var body: some View {
        Text("Next View")
            .font(.title)
            .padding()
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSelectionView()
    }
}
