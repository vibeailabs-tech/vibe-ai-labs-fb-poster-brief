import PDFKit
import Foundation
let d = PDFDocument(url: URL(fileURLWithPath: CommandLine.arguments[1]))!
print("pages:", d.pageCount)
for i in 0..<d.pageCount { print("--- page \(i+1)"); print(d.page(at: i)?.string ?? "") }
