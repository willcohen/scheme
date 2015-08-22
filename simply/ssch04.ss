;;; 4.4

(define (sphere-volume r)
  (* (/ 4 3) 3.141592654 (* r r r)))

(define (next x)
  (+ x 1))

(define (square x)
  (* x x))

(define (triangle-area base height)
  (* 0.5 base height))

(define (sum-of-squares x y)
  (+ (* x x) (* y y)))

;;; 4.5
(define (c-to-f x)
  (+ (* (/ 9 5) x) 32))
(define (f-to-c x)
  (* (/ 5 9) (- x 32)))

;;; 4.6
(define (fourth x)
  (* x x x x))

(define (fourth x)
  (square (square x)))

;;; 4.7
(define (abs-value x)
  (sqrt (square x)))

;;; 4.8
(define (scientific base exponent)
  (* base (expt 10 exponent)))

(define (sci-coefficient orig)
  (/ orig (expt 10 (floor (/ (log orig) (log 10))))))

(define (sci-exponent orig)
  (floor (/ (log orig) (log 10))))

;; 4.9
(define (discount price discount)
  (* price (- 1 (* 0.01 discount))))

;; 4.10
(define (tip price)
  (- (ceiling (* price 1.15)) price))
