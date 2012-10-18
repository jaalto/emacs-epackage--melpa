
;;;### (autoloads (package-build-all package-build-current-recipe
;;;;;;  package-build-archive) "../package-build" "../package-build.el"
;;;;;;  (20607 52132))
;;; Generated autoloads from ../package-build.el

(autoload 'package-build-archive "package-build" "\
Build a package archive for package NAME.

\(fn NAME)" t nil)

(autoload 'package-build-current-recipe "package-build" "\
Build archive for the recipe defined in the current buffer.

\(fn)" t nil)

(autoload 'package-build-all "package-build" "\
Build all packages in the `package-build-alist'.

\(fn)" t nil)

;;;***

;;;### (autoloads (package-filter package-filter-function package-archive-exclude-alist
;;;;;;  package-archive-enable-alist) "../melpa" "../melpa.el" (20607
;;;;;;  52132))
;;; Generated autoloads from ../melpa.el

(defvar package-archive-enable-alist nil "\
Optional Alist of enabled packages used by `package-filter'.
The format is (ARCHIVE . PACKAGE ...), where ARCHIVE is a string
matching an archive name in `package-archives', PACKAGE is a
symbol of a package in ARCHIVE to enable.

If no ARCHIVE exists in the alist, all packages are enabled.")

(custom-autoload 'package-archive-enable-alist "../melpa" t)

(defvar package-archive-exclude-alist nil "\
Alist of packages excluded by `package-filter'.
The format is (ARCHIVE . PACKAGE ...), where ARCHIVE is a string
matching an archive name in `package-archives', PACKAGE is a
symbol of a package in that archive to exclude.

Any specified package is excluded regardless of the value of
`package-archive-enable-alist'")

(custom-autoload 'package-archive-exclude-alist "../melpa" t)

(defvar package-filter-function 'package-filter "\
Optional predicate function used to internally
filter packages used by package.el.

Return nil to filter a function from the list.

The function is called with the arguments PACKAGE VERSION ARCHIVE, where
PACKAGE is a symbol, VERSION is a vector as produced by `version-to-list', and
ARCHIVE is the string name of the package archive.")

(custom-autoload 'package-filter-function "../melpa" t)

(defadvice package-compute-transaction (before package-compute-transaction-reverse (package-list requirements) activate compile) "\
reverse the requirements" (setq requirements (reverse requirements)) (print requirements))

(defadvice package--add-to-archive-contents (around package-filter-add-to-archive-contents (package archive) activate compile) "\
Add filtering of available packages using `package-filter-function',
if non-nil." (when (and package-filter-function (funcall package-filter-function (car package) (package-desc-vers (cdr package)) archive)) ad-do-it))

(autoload 'package-filter "melpa" "\
Check package against enabled and excluded list for the `archive'.

Filter packages not in the associated list for `archive' in
`package-archive-enable-alist'.

Filter packages in the associated list for `archive' in
`package-archive-exclude-alist'.

\(fn PACKAGE VERSION ARCHIVE)" nil nil)

;;;***
(provide 'melpa-epackage-0loaddefs)
