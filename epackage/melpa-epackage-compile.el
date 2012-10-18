(dolist (file
         '("json-fix.el"
	   "melpa.el"
	   "missing.el"
	   "package-build.el"
	   ;; "recipes/.dir-locals.el"
	   ;; "recipes/underwater-theme.el"
	   ))
  (if (and (boundp 'verbose)
	   verbose)
      (message "Byte Compile %s" file))
  (if (file-exists-p file)
      (byte-compile-file file)
    (message "** Byte compile error. Not found: %s" file)))
