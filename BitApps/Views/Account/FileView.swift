//
//  FileView.swift
//  BitApps
//
//  Created by Jim Phieffer on 11/5/22.
//

import SwiftUI
import UIKit

struct FileView: UIViewControllerRepresentable {
    let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.zip], asCopy: true)
    var callback: ([URL]) -> Void
    var delegate: FileViewDelegate
    
    init(callback: @escaping ([URL]) -> Void) {
        self.callback = callback
        delegate = FileViewDelegate(callback: callback)
    }
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        documentPicker.delegate = delegate
        return documentPicker
    }
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}

class FileViewDelegate: NSObject, UIDocumentPickerDelegate {
    var callback: ([URL]) -> Void
    
    init(callback: @escaping ([URL]) -> Void) {
        self.callback = callback
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        callback(urls)
    }
}
