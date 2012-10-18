(require 'advice)
(ad-disable-advice 'package-compute-transaction 'before "package-compute-transaction-reverse")
(ad-disable-advice 'package--add-to-archive-contents 'around "package-compute-transaction-reverse")
(provide 'melpa-epackage-uninstall)
