;;; Time-stamp: <2015-03-11 23:28:50 wcohen>
;;; Created Wed Mar 11 22:25:20 2015

;;; Racket loads Simply Scheme extension
(require (planet dyoo/simply-scheme:2:2))

;;; 10.1

(define (already-won? position me)
  (not (empty?
    (keep (lambda (triple) (my-win? triple me)) (find-triples position)))))

(define (my-win? triple me)
  (and (= (appearances me triple) 3)
       (= (appearances (opponent me) triple) 0)))

;;; 10.2

(define (tie-game? position)
  (empty? (keep number? (accumulate word (find-triples position)))))

;;; 10.3

(define (new-board position me number)
  (every (lambda (letter)
	   (if (equal? (ttt position me) ()))) position))

(define (tie-game? position me)
  (or (already-won? (ttt position me) me)
       (already-won? (ttt position (opposite me)) (opposite me))))

;;; 10.3

(define (tie-game? position)
  (and (<= (appearances '_ position) 2)
       (neither-has-won position)
       (neither-can-win position)))n

(define (neither-has-won position)
  (and (not (already-won? position 'x))
       (not (already-won? position 'o))))

(define (neither-can-win position)
  (and (not (i-can-win? (find-triples position) 'x))
       (not (i-can-win? (find-triples position) 'o))))
