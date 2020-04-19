import Cocoa
import SwiftyMarkdown
import Preferences

class AcknowledgmentsTab: NSViewController, PreferencePane {
    let preferencePaneIdentifier = PreferencePane.Identifier("Acknowledgments")
    let preferencePaneTitle = NSLocalizedString("Acknowledgments", comment: "")
    let toolbarItemIcon = NSImage(named: NSImage.userAccountsName)!

    override func loadView() {
        let markdownFileUrl = Bundle.main.url(forResource: "ACKNOWLEDGMENTS", withExtension: "md")!
        let md = SwiftyMarkdown(url: markdownFileUrl)!
        md.h2.fontSize = 20
        let textView = TextField(md.attributedString())

        let scrollView = ScrollView()
        scrollView.scrollerKnobStyle = .default
        scrollView.documentView!.subviews = [textView]
        scrollView.frame.size = NSSize(width: textView.fittingSize.width, height: textView.fittingSize.width)
        scrollView.contentView.frame.size = textView.fittingSize
        scrollView.documentView!.frame.size = textView.fittingSize
        scrollView.fit(textView.fittingSize.width, textView.fittingSize.width)

        let grid = GridView([[scrollView]])
        grid.fit()
        view = grid
    }
}
