;;; Time-stamp: <2015-03-09 22:34:39 wcohen>
;;; Created Mon Mar 09 21:27:58 2015

;;; Racket loads Simply Scheme extension
(require (planet dyoo/simply-scheme:2:2))

(define (card-val card)
  (let ((num (bf card)))
    (cond ((eq? num 'a) '4)
       ((eq? num 'k) '3)
       ((eq? num 'q) '2)
       ((eq? num 'j) '1)
       (else '0))))

(define (high-card-points hand)
  (accumulate + (every card-val hand)))

(define (count-suit suit hand)
  (count (keep (lambda (card) (eq? (first card) suit)) hand)))

(define (suit-counts hand)
  (every (lambda (suit) (count-suit suit hand)) '(s h c d)))

(define (suit-dist-points num)
  (cond ((= num 2) 1)
	((= num 1) 2)
	((= num 0) 3)
	(else 0)))

(define (hand-dist-points hand)
  (accumulate + (every suit-dist-points (suit-counts hand))))

(define (bridge-val hand)
  (+ (high-card-points hand) (hand-dist-points hand)))
