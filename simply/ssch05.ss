(require (planet dyoo/simply-scheme:2:2))

;;; 5.2

(define (f1 arg1 arg2)
  (se (bf arg1) (bl arg2)))

(define (f2 arg1 arg2)
  (se (f1 arg1 arg2) (word (first arg1) (last arg2))))

(define (f3 arg1 arg2)
  (se arg1 arg1))

(define (f4 arg1 arg2)
  (word  (first (bf (bl arg1))) (first (bf (bl arg2)))))

;;; 5.14

(define (third wd)
  (first (bf (bf wd))))

;;; 5.15

(define (first-two wd)
  (word (first wd) (first (bf wd))))

;;; 5.16

(define (two-first wd1 wd2)
  (word (first wd1) (first wd2)))

(define (two-first-sent sent)
  (two-first (first sent) (last sent)))

;;; 5.17

(define (knight name)
  (se 'sir name))

;;; 5.18

(define (ends word)
  (word (first word) (last word)))

;;; 5.19

(define (insert-and items)
  (se (bl items) 'and (last items)))

;;; 5.20

(define (middle-names names)
  (bf (bl names)))

;;; 5.21

(define (query question)
  (se (first (bf question)) (first question) (bf (bf (bl question)))
      (word (last question) '?)))
