

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
;;; Set tab spacing
(setq-default c-basic-offset 4)
(setq-default c-default-style ((java-mode . "java") (awk-mode . "awk") (c-mode . "k&r") (c++-mode . "k&r") (other . "gnu")))