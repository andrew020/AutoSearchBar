import UIKit

extension UISearchBar {
    
    // MARK: - Private
    // MARK: Properties
    
    private static var isOpenAutoSearchKey = "com.auto_search_bar.is_open_auto_search"
    private var isOpenAutoSearch: Bool? {
        get {
            return objc_getAssociatedObject(self, &UISearchBar.isOpenAutoSearchKey) as? Bool
        }
        set {
            objc_setAssociatedObject(self, &UISearchBar.isOpenAutoSearchKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
            let textFieldInsideUISearchBar = self.value(forKey: "searchField") as? UITextField
            let selector = #selector(searchTextDidChanged(_:))
            if newValue == true {
                textFieldInsideUISearchBar?.addTarget(self, action: selector, for: .editingChanged)
            }
            else {
                textFieldInsideUISearchBar?.removeTarget(self, action: selector, for: .editingChanged)
            }
        }
    }
    
    private static var hasDelyCallKey = "com.auto_search_bar.has_dely_call"
    private var hasDelyCall: Bool? {
        get {
            return objc_getAssociatedObject(self, &UISearchBar.hasDelyCallKey) as? Bool
        }
        set {
            objc_setAssociatedObject(self, &UISearchBar.hasDelyCallKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }

    // MARK: Search Text Did Changes Response
    
    @objc private func searchTextDidChanged(_ textField: UITextField) -> Void {
        self.cancelAutoSearch()
        if self.isOpenAutoSearch ?? false {
            self.hasDelyCall = true
            self.perform(#selector(delyCall), with: self, afterDelay: 0.5)
        }
    }
    
    // MARK: Dely call
    
    @objc private func delyCall() -> Void {
        let selector = #selector(UISearchBarDelegate.searchBarSearchButtonClicked(_:))
        guard let delegate = self.delegate,
        delegate.responds(to: selector)
        else {
            return;
        }
        self.hasDelyCall = false
        delegate.perform(selector, with: self)
    }
    
    // MARK: - Public Method
    
    @objc public func cancelAutoSearch() -> Void {
        if self.hasDelyCall ?? false {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(delyCall), object: self)
            self.hasDelyCall = false
        }
    }
    
    @objc public func setAutoSearch(enable: Bool) -> Void {
        if self.isOpenAutoSearch != enable {
            self.isOpenAutoSearch = enable
        }
    }
}
