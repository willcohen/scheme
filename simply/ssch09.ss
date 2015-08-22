;;; Time-stamp: <2015-03-09 21:27:20 wcohen>
;;; Created Sun Mar 08 15:24:38 2015

;;; Racket loads Simply Scheme extension
(require (planet dyoo/simply-scheme:2:2))

;;; 9.2

(define second
  (lambda (stuff) (first (bf stuff))))

(define make-adder
  (lambda (num)
    (lambda (x) (+ num x))))

;;; 9.3

(define (let-it-be sent)
  (accumulate (lambda (x y) y) sent))

;;; 9.4

(define (who sent)
  (every (lambda (person) (se person sent)) '(pete roger john keith)))

;;; 9.5

(define (prepend-every pref sent)
  (every (lambda (wd) (word pref wd)) sent))

;;; 9.6

(define (sentence-version f)
  (lambda (wd) (every f wd)))

;;; 9.7

(define (letterwords ltr sent)
  (keep (lambda (wd) (member? ltr wd)) sent))

;;; 9.8

(define (hang-letter letter guesses)
  (if (member? letter guesses)
      letter '_))

(define (hang orig ltrs)
  (accumulate word (every (lambda (ltr) (hang-letter ltr ltrs))
			  orig)))

;;; 9.9

(define (common-words sent1 sent2)
  (keep (lambda (wd) (member? wd sent2)) sent1))

;;; 9.10

(define (appearances wd sent)
  (count (keep (lambda (arg) (equal? wd arg)) sent)))

;;; 9.11

(define (unabbrev sent1 sent2)
  (every (lambda (wd) (if (number? wd) (item wd sent2) wd)) sent1))

;;; 9.12

(define (first-last sent)
  (keep (lambda (wd) (equal? (first wd) (last wd))) sent))

;;; 9.13

(define (compose f g)
  (lambda (x) (f (g x))))

;;; 9.14

(define (substitute wd1 wd2 sent)
  (every (lambda (wd) (if (equal? wd wd2) wd1 wd)) sent))

;;; 9.15

(define (type-check f pred)
  (lambda (x) (if (pred x) (f x) #f)))

;;; 9.16

(define (aplize func)
  (lambda (x) (if (word? x) (func x) (every func x))))

;;; 9.17

(define (keep-test func sent)
  (accumulate se (every (lambda (wd) (if (func wd) wd '())) sent)))
