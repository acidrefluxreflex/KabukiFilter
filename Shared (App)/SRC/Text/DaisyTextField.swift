//
//  DaisyTextField.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/26.
//

import SwiftUI


struct DaisyTextField: View {
    
    @Binding private var text: String
    @State private var placeholder: String
    @State private var height: CGFloat

    @State private var borderColor: Color = Color.gray
    @State private var borderWidth: Double = 1.0
    @State private var editing: Bool = false
    @FocusState private var nameFieldIsFocused: Bool

    @State private var placeholderBackgroundOpacity: Double = 0.0
    @State private var placeholderFontSize: Double = 16.0
    @State private var placeholderLeadingPadding: Double = 2.0
    @State private var placeholderBottomPadding: Double = 0.0
    @State private var placeholderColor: Color = Color.gray
    
    private var textFieldOnEditingChanged: (Bool) -> Void
    private var textFieldOnCommit: () -> Void


    init(
        text: Binding<String>,
        placeholder: String = "Placeholder",
        height: CGFloat = 50,
        onEditingChanged: @escaping (Bool) -> Void = { _ in },
        onCommit: @escaping () -> Void = {}
    ) {
        self._text = text
        self.placeholder = placeholder
        self.height = height
        self.textFieldOnEditingChanged = onEditingChanged
        self.textFieldOnCommit = onCommit
    }

    var body: some View {

        ZStack {
            ZStack(alignment: fieldAlign()) {
                RoundedRectangle(cornerRadius: 8.0, style: .continuous)
                    .foregroundColor(Color.theme(.ThemeGray))
                RoundedRectangle(cornerRadius: 8.0, style: .continuous)
                    .stroke(borderColor, lineWidth: borderWidth)
                    .foregroundColor(.secondary)
                    .frame(height: height)
                VStack {
                    TextField(
                        editing ? "" : placeholder,
                        text: $text,
                        axis: fieldAxis()
                    )
                    .focused($nameFieldIsFocused)
                    .padding(9)
                }
            }.frame(height: height)
       
        }
        .onChange(of: nameFieldIsFocused) { newValue in
            withAnimation(.easeOut(duration: 0.1)) {
                editing.toggle()
                updateBorder()
                updatePlaceholder()
            }
        }
        .frame(height: height)

    }

    private func updateBorder() {
        updateBorderColor()
        updateBorderWidth()
    }

    private func updateBorderColor() {
        if editing {
            borderColor = .blue
            return
        }
        borderColor = .gray
    }

    private func updateBorderWidth() {
        borderWidth = editing ? 2.0 : 1.0
    }

    private func updatePlaceholder() {
        updatePlaceholderBackground()
        updatePlaceholderColor()
        updatePlaceholderFontSize()
        updatePlaceholderPosition()
    }

    private func updatePlaceholderColor() {
        if editing || !text.isEmpty {
            placeholderColor =
                editing
                ? .blue
                : .gray
        } else {
            placeholderColor = .gray
        }

    }

    private func updatePlaceholderBackground() {
        if editing || !text.isEmpty {
            placeholderBackgroundOpacity = 1.0
        } else {
            placeholderBackgroundOpacity = 0.0
        }
    }

    private func updatePlaceholderFontSize() {
        if editing
            || !text.isEmpty
        {
            placeholderFontSize = 10.0
        } else {
            placeholderFontSize = 16.0
        }
    }

    private func updatePlaceholderPosition() {
        if editing
            || !text.isEmpty
        {
            placeholderBottomPadding = height - 3.0
            placeholderLeadingPadding = 8.0
        } else {
            placeholderBottomPadding = 0.0
            placeholderLeadingPadding = 8.0
        }
    }

    private func fieldAlign() -> Alignment {
        if height >= 80 {
            return .top
        } else {
            return .center
        }
    }
    private func fieldAxis() -> Axis {
        if height >= 80 {
            return .vertical
        } else {
            return .horizontal
        }
    }

    private enum Field {
        case textField
    }
}
private struct TestCustom: View {

    @State private var text: String = "momo"

    var body: some View {
        VStack {
            Text(text)

            DaisyTextField(
                text: $text,
                height: 180
            )
            .font(.title3)
            .padding()
            DaisyTextField(text: $text)
                .padding()
        }
    }
}

struct DaisytextField_Previews: PreviewProvider {
    static var previews: some View {
        TestCustom()
    }
}
