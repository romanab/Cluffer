(cl:in-package #:cluffer)

(defclass buffer () ())

(defclass line ()
  ((%dock :initarg :dock :initform nil :accessor dock)))

(defclass cursor () ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Generic function ITEM-COUNT.
;;;
;;; Return the number of items in ENTITY.

;;; If ENTITY is a buffer, then the total number of items in the
;;; buffer is returned.
;;;
;;; IF ENTITY is a line, then the number of items in the line is
;;; returned.
;;;
;;; If ENTITY is a cursor that is currently attached to a line, the
;;; number of items of the line to which the cursor is attached is
;;; returned.
;;;
;;; If ENTITY is a cursor that is currently not attached to a line,
;;; then an error of type DETACHED-CURSOR is signaled.

(defgeneric item-count (entity))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Generic function CURSOR-POSITION.
;;;
;;; Given a cursor, return its conceptual position.
;;;
;;; If CURSOR is currently not attached to a line, then an error of
;;; type DETACHED-CURSOR is signaled.

(defgeneric cursor-position (cursor))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Generic function (SETF CURSOR-POSITION).
;;;
;;; Given a cursor, set its conceptual position.
;;;
;;; If POSITION is negative or greater than the item count of the line
;;; to which the cursor is attached, then an error is signaled.
;;;
;;; If CURSOR is currently not attached to a line, then an error of
;;; type DETACHED-CURSOR is signaled.

(defgeneric (setf cursor-position) (position cursor))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Generic function BEGINNING-OF-LINE-P.
;;;
;;; Return true if and only if CURSOR is positioned at the beginning
;;; of the line to which it is attached.
;;;
;;; If CURSOR is currently not attached to a line, then an error of
;;; type DETACHED-CURSOR is signaled.
;;;
;;; Calling this function has the same effect as calling the function
;;; CURSOR-POSITION and checking whether the return value is zero, but
;;; this function might be implemented differently.

(defgeneric beginning-of-line-p (cursor))
