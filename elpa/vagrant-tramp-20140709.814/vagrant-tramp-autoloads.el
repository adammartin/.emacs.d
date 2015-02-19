;;; vagrant-tramp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (vagrant-tramp-enable vagrant-tramp-term vagrant-tramp-ssh)
;;;;;;  "vagrant-tramp" "vagrant-tramp.el" (21734 279 0 0))
;;; Generated autoloads from vagrant-tramp.el

(defconst vagrant-tramp-method "vagrant" "\
TRAMP method for vagrant boxes.")

(defvar vagrant-tramp-ssh (executable-find (concat (file-name-directory (or load-file-name buffer-file-name)) "bin/vagrant-tramp-ssh")) "\
The vagrant-tramp-ssh executable.")

(custom-autoload 'vagrant-tramp-ssh "vagrant-tramp" t)

(autoload 'vagrant-tramp-term "vagrant-tramp" "\
SSH to a Vagrant BOX in an `ansi-term'.

\(fn BOX)" t nil)

(autoload 'vagrant-tramp-enable "vagrant-tramp" "\
Add `vagrant-tramp-method' to `tramp-methods'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("vagrant-tramp-pkg.el") (21734 279 253027
;;;;;;  0))

;;;***

(provide 'vagrant-tramp-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vagrant-tramp-autoloads.el ends here
