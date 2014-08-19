(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-indent-delete-trailing-whitespace-on-save-file t)
 '(auto-indent-on-visit-file t)
 '(enh-ruby-indent-tabs-mode t)
 '(ido-enable-flex-matching t)
 '(kill-whole-line t)
 '(magit-diff-options (quote ("--ignore-all-space")))
 '(magit-item-highlight-face (quote bold))
 '(magit-use-overlays nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/stuff/git-modes")
(add-to-list 'load-path "~/.emacs.d/stuff/magit")
(add-to-list 'load-path "~/.emacs.d/stuff/emacs-color-theme-solarized")
(add-to-list 'load-path "~/.emacs.d/stuff/tomorrow-theme")
(add-to-list 'load-path "~/.emacs.d/stuff/url-http-ntlm")
(add-to-list 'load-path "~/.emacs.d/stuff/enhanced-ruby-mode")
(add-to-list 'load-path "~/.emacs.d/stuff/popwin-el")
(add-to-list 'load-path "~/.emacs.d/stuff/guide-key")

(package-initialize)

(require 'ido)
(require 'tomorrow-night-theme)
(require 'ace-jump-mode)
(require 'fold-dwim)
(require 'yasnippet)
(require 'magit)
(require 'flymake-ruby)
(require 'winner)
(require 'popwin)
(require 'guide-key)
(require 'windmove)
(require 'smex)

(defun adam-rspec (prefix)
  (interactive "p")
  (with-temp-buffer
    (if (= 1 prefix)
	(progn
	  (cd "~/Projects/Stalingrad/")
	  (compile "bundle exec rspec"))
      (cd "~/Projects/Stalingrad/acceptance-tests")
      (compile "bundle exec cucumber"))))

(defun ms-proxy-on ()
  (interactive)
  (setq url-proxy-services '(
                             ("no_proxy" . "\\(localhost\\|127.0.0.1\\)")
                             ("http" . "proxyv.dpn.deere.com:81")
                             ("https" . "proxyv.dpn.deere.com:81"))))

(defun ms-proxy-off ()
  (interactive)
  (setq url-proxy-services nil))

(defun ms-enh-ruby-mode-hook ()
  (set (make-local-variable 'yas-extra-modes) '(prog-mode ruby-mode text-mode)))
                                        ;  (dolist (ind '(enh-ruby-indent-level
                                        ;                enh-ruby-hanging-indent-level
                                        ;                enh-ruby-hanging-paren-indent-level
                                        ;                enh-ruby-hanging-brace-indent-level))
                                        ;    (set (make-local-variable ind) 8)))

(defun ms-tmp-hack ()
					;  (enh-ruby-end-of-block)
  (ruby-end-of-block)
  )
(ido-mode 1)
(ido-vertical-mode 1)
(auto-indent-global-mode)
(projectile-global-mode 1)
(global-linum-mode 1)
(global-auto-revert-mode 1)
(global-undo-tree-mode 1)
(yas-global-mode 1)
(recentf-mode 1)
(rainbow-delimiters-mode 1)
(yas-reload-all)
(tool-bar-mode -1)
(winner-mode 1)
(guide-key-mode 1)

(setq hs-allow-nesting t)
(setq guide-key/guide-key-sequence '("C-x" "C-c"))
(setq guide-key/popup-window-position 'bottom)
(setq guide-key/recursive-key-sequence-flag t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'hs-minor-mode)
(add-hook 'ruby-mode-hook 'hideshowvis-enable)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'enh-ruby-mode-hook 'ms-enh-ruby-mode-hook)

(add-to-list 'hs-special-modes-alist
	     '(enh-ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ms-tmp-hack)) nil))
(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ms-tmp-hack)) nil))

(global-set-key (kbd "M-SPC") 'ace-jump-mode)
(global-set-key (kbd "<f7>")      'fold-dwim-toggle)
(global-set-key (kbd "<M-f7>")    'fold-dwim-hide-all)
(global-set-key (kbd "<S-M-f7>")  'fold-dwim-show-all)
(global-set-key (kbd "C-c C-p") 'adam-rspec)
(global-set-key (kbd "C-x m") 'magit-status)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-y") 'browse-kill-ring)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(windmove-default-keybindings)
(put 'downcase-region 'disabled nil)




(setq browse-kill-ring-quit-action 'save-and-restore)
(add-to-list 'projectile-globally-ignored-directories "coverage")

(defun adam/feature-hack ()
  (setq indent-line-function 'indent-relative))

(add-hook 'feature-mode-hook 'adam/feature-hack)

(when (eq system-type 'darwin)
  (exec-path-from-shell-initialize))
