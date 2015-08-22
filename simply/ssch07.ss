(require (planet dyoo/simply-scheme:2:2))

;;; 7.1

(define (vowel? letter)
  (member? letter 'aeiou))

(define (gertrude wd)
  (let ((indefinite (if (vowel? (first wd)) 'an 'a)))
    (se indefinite wd 'is indefinite wd 'is indefinite wd)))

;;; 7.2

(let ((pi 3.14159)
      (pie '(lemon meringue)))
  (se '(pi is) pi '(but pie is) pie))

;;; 7.3

(define (superlative adj wd)
  (se (word adj 'est) wd))



