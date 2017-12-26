;;; hp42s-mode.el --- sample major mode for editing HP42s code. -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2017, by Stefanos Carlström

;; Author: Stefanos Carlström ( stefanos.carlstrom@gmail.com )
;; Version: 0.1
;; Created: 26 Dec 2017
;; Keywords: languages
;; Homepage: http://ergoemacs.org/emacs/elisp_syntax_coloring.html

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;;; Commentary:

;; short description here

;; full doc on how to use here

;;; Code:

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq hp42s-font-lock-keywords
      (let* (
             ;; define several category of keywords
             (x-keywords '("LBL" "▸LBL" "END" "TO"
                           "IND" "ST X" "ST Y" "ST Z" "ST L"
                           "AND" "OR" "XOR"))
             (x-constants '("PI"))
             (x-functions '("ABS" "ACOS" "ACOSH" "ADV" "AGRAPH" "AIP" "ALENG" "ALL" "ALLΣ" "AOFF"
                            "AON" "ARCL" "AROT" "ASHF" "ASIN" "ASINH" "ASSIGN" "ASTO" "ATAN"
                            "ATANH" "ATOX" "AVIEW" "BASE+" "BASE-" "BASE×" "BASE÷" "BASE+/-"
                            "BEEP" "BEST" "BINM" "BIT?" "CF" "CLA" "CLD" "CLKEYS" "CLLCD" "CLMENU"
                            "CLP" "CLRG" "CLST" "CLV" "CLX" "CLΣ" "COMB" "COMPLEX" "CORR" "COS"
                            "COSH" "CPXRES" "CPX?" "CROSS" "CUSTOM" "DECM" "DEG" "DELAY" "DELR"
                            "DET" "DIM" "DIM?" "DOT" "DSE" "EDIT" "EDITN" "ENG" "ENTER" "EXITALL"
                            "EXPF" "E↑X" "E↑X-1" "FC?" "FC?C" "FCSTX" "FCSTY" "FIX" "FNRM" "FP"
                            "FS?" "FS?C" "GAMMA" "GETKEY" "GETM" "GRAD" "GROW" "GTO" "HEXM" "HMS+"
                            "HMS-" "I+" "I-" "INDEX" "INPUT" "INSR" "INTEG" "INVRT" "IP" "ISG"
                            "J+" "J-" "KEYASN" "KEY" "LASTX" "LCLBL" "LINF" "LINΣ" "LN" "LN1+X"
                            "LOG" "LOGF" "MAN" "MAT?" "MEAN" "MENU" "MOD" "MVAR" "N!" "NEWMAT"
                            "NORM" "NOT" "OCTM" "OFF" "OLD" "ON" "PERM" "PGMINT" "PGMSLV" "PIXEL"
                            "POLAR" "POSA" "PRA" "PRLCD" "PROFF" "PROMPT" "PRON" "PRSTK" "PRUSR"
                            "PRV" "PRX" "PRΣ" "PSE" "PUTM" "PWRF" "RAD" "RAN" "RCL" "RCL+" "RCL-"
                            "RCL×" "RCL÷" "RCLEL" "RCLIJ" "RDX," "RDX." "REALRES" "REAL?" "RECT"
                            "RND" "RNRM" "ROTXY" "RSUM" "RTN" "R<>R" "R↑" "R↓" "SCI" "SDEV" "SEED"
                            "SF" "SIGN" "SIN" "SINH" "SIZE" "SLOPE" "SOLVE" "SQRT" "STO" "STO+"
                            "STO-" "STO×" "STO÷" "STOEL" "STOIJ" "STOP" "STR?" "SUM" "TAN" "TANH"
                            "TONE" "TRACE" "TRANS" "UVEC" "VARMENU" "VIEW" "WMEAN" "WRAP" "X<>"
                            "X<>Y" "X<0?" "X<Y?" "X≤0?" "X≤Y?" "X=0?" "X=Y?" "X≠0?" "X≠Y?" "X>0?"
                            "X>Y?" "X≥0?" "X≥Y?" "XEQ" "XTOA" "X↑2" "YINT" "Y↑X" "1/X" "10↑X" "+"
                            "-" "×" "÷" "+/-" "Σ+" "Σ-" "ΣREG" "ΣREG?" "→DEC" "→DEG" "→HMS" "→HR"
                            "→OCT" "→POL" "→RAD" "→REC" "←" "↑" "↓" "→" "%" "%CH" "[FIND]" "[MAX]"
                            "[MIN]"))
             (x-ops '("←" "↑" "↓" "→" "%" "+" "-" "×" "÷" "+/-"))

             ;; generate regex string for each category of keywords
             (x-keywords-regexp (regexp-opt x-keywords 'words))
             (x-constants-regexp (regexp-opt x-constants 'words))
             (x-functions-regexp (regexp-opt x-functions t))
             (x-comments-regexp "\\{[^\\}]*\\}")
             (x-numbers-regexp "[\-]\\{0,1\\}[0-9ᴇ\.]+"))

        `(
          (,x-constants-regexp . font-lock-constant-face)
          ;; (,x-numbers-regexp . font-lock-constant-face)
          (,x-functions-regexp . font-lock-function-name-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          (,x-comments-regexp . font-lock-comment-face)
          
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

;;;###autoload
(define-derived-mode hp42s-mode prog-mode "HP42s"
  "Major mode for editing HP42s code."

  ;; code for syntax highlighting
  (setq font-lock-defaults '((hp42s-font-lock-keywords)))

  (add-to-list 'auto-mode-alist '("\\.hp42s$" . hp42s-mode)))

;; add the mode to the `features' list
(provide 'hp42s-mode)

;;; hp42s-mode.el ends here
