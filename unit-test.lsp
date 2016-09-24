(progn (load "/Users/eihli/.emacs.d/elpa/slime-20160831.1520/swank-loader.lisp" :verbose t) (funcall (read-from-string "swank-loader:init")) (funcall (read-from-string "swank:start-server") "/var/folders/wh/kjbvn3cs1vs0lmx4hx387fqr0000gn/T/slime.6137"))

This is SBCL 1.1.6.0-3c5581a, an implementation of ANSI Common Lisp.
More information about SBCL is available at <http://www.sbcl.org/>.

SBCL is free software, provided as is, with absolutely no warranty.
It is mostly in the public domain; some portions are provided under
BSD-style licenses.  See the CREDITS and COPYING files in the
distribution for more information.
* 
; loading #P"/Users/eihli/.emacs.d/elpa/slime-20160831.1520/swank-loader.lisp"
STYLE-WARNING: redefining EMACS-INSPECT (#<BUILT-IN-CLASS T>) in DEFMETHOD
;; Swank started at port: 55282.
55282
* (test)

; in: TEST
;     (TEST)
; 
; caught STYLE-WARNING:
;   undefined function: TEST
; 
; compilation unit finished
;   Undefined function:
;     TEST
;   caught 1 STYLE-WARNING condition

* (test-+)

T
* 