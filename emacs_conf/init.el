(setq inhibit-startup-message t)
(tool-bar-mode -1)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 280)
(load-theme 'wombat)

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
      			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/package/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(add-hook 'window-setup-hook 'toggle-frame-maximized t)

(setq c-default-style "linux"
      c-basic-offset 4)

(electric-pair-mode 1)
(setq line-number-mode t)
(global-set-key (kbd "C-x é") 'split-window-horizontally)
(global-set-key (kbd "C-x \"") 'split-window-vertically)
(global-set-key (kbd "C-x à") 'delete-window)
(global-set-key (kbd "C-x &") 'delete-other-windows)
