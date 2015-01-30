;; 1.2 P78
;; exercise 1.9
(define (plus-1 a b)
  (define (inc x)
    (+ x 1))
  (define (dec)
    (- a 1))
  (if (= a 0)
    b
    (inc (plus-1 (dec) b))))
;; linear recursive process
;; (plus-1 4 5)
;; (inc (plus-1 3 5))
;; (inc (inc (plus-1 2 5)))
;; (inc (inc (inc (plus-1 1 5))))
;; (inc (inc (inc (inc (plus-1 0 5)))))
;; (inc (inc (inc (inc (5)))))
;; (inc (inc (inc (6))))
;; (inc (inc (7)))
;; (inc (8))
;; (9)

(define (plus-2 a b)
  (define (dec)
    (- a 1))
  (define (inc)
    (+ b 1))
  (if (= a 0)
      b
      (plus-2 (dec) (inc))))
;; Linear iterative process
;; (plus-2 4 5)
;; (plus-2 3 6)
;; (plus-2 2 7)
;; (plus-2 1 8)
;; (plus-2 0 9)

;; exercise 1.10
;; Ackermann function
(define (Ack x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (Ack (- x 1)
                   (Ack x (- y 1))))))
;; (Ack 0 n) = 2n
;; (Ack 1 n) = 2^n
;; (Ack 2 n) = 2^2^...(ntimes)

;; exercise 1.11
;; f(n) = n if n<3
;; and f(n) = f(n-1)+2f(n-2)+3f(n-3) if n >=3
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))
(define (f-iter n)
  (define (iter a b c n)
    ;; a = f(n-1), b = f(n-2), c = f(n-3)
    ;; return a+2b+3c
    (if (< n 3)
        a
        (iter (+ a (* b 2) (* c 3)) a b (- n 1))))
  (iter 2 1 0 n))

;; exercise 1.12
;; The numbers at the edge of the triangle are all 1, and each number
;; inside the triangle is the sum of the two numbers above it.
;; Write a procedure that computes elements of Pascal's triangle by means of a recursive process.
