;;; Time-stamp: <2015-03-22 15:12:33 wcohen>
;;; Created Thu Mar 12 08:45:26 2015

;;; Racket loads Simply Scheme extension
(require (planet dyoo/simply-scheme:2:2))

(define (explode0 wd)
  '())

(define (explode1 wd)
  (se (first wd) (explode0 wd)))

(define (explode2 wd)
  (se (first wd) (explode1 (bf wd))))

(define (explode wd)
  (if (= (count wd) 0) '() (se (first wd) (explode (bf wd)))))

(define (letter-pairs0 wd)
  '())

(define (letter-pairs1 wd)
  '())

(define (letter-pairs2 wd)
  (se wd))

(define (letter-pairs3 wd)
  (se (word (first wd) (first (bf wd))) (word (first (bf wd)) (last
							       wd))))
(define (letter-pairs3 wd)
  (se (bl wd) (bf wd)))

(define (letter-pairs4 wd)
  (se (bl (bl wd))
      (bl (bf wd))
      (bf (bf wd))))

(define (letter-pairs4 wd)
  (se (bl (bl wd))
      (letter-pairs3 (bf wd))))

(define (first-two wd)
  (word (first wd) (first (bf wd))))

(define (letter-pairs5 wd)
  (se (first-two wd) (letter-pairs4 (bf wd))))

(define (letter-pairs wd)
  (if (<= (count wd) 1) '()
      (se (word (first wd) (first (bf wd)))
	  (letter-pairs (bf wd)))))


