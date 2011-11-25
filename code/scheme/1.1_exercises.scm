;; sicp P60 
;; exercise 1.6
(include "sqrt-iter.scm")

(define (new-if predicate then-clause else-clause)
        (cond (predicate then-clause)
              (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x) 
                         x)))

;; This does not work because the interpreter uses applicative order application
;; therefore new-sqrt-iter will be called ad infinitum.
;; if uses a special form because it uses normal order application.

;; exercise 1.7
;; For very small numbers the tolerance value for good-enough? is too large 
;; and will produce significant differences.
;; For very large numbers, since they are represented with limited precision
;; a small value such as 0.001 will not be determined and therefore the program
;; will not terminate
;; improved version
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (abs (* guess 0.001))))

;; exercise 1.8
;; implement newton's method for finding cube root using approximation:
;; ( (x/y^2) + 2y ) / 3
(define (cube-rt-iter guess x)
  (if (good-enough-cube? guess x)
      guess
      (cube-rt-iter (improve-cube guess x) x)))
(define (good-enough-cube? guess x)
  (< (abs (- (* guess guess guess) x)) 
     (abs (* guess guess 0.001))))
(define (improve-cube guess x)
  (/ (+ (* 2 guess)
        (/ x (square guess)))
     3))
(define (my-cube-rt x)
  (cube-rt-iter 1.0 x))

