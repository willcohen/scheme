(require (planet dyoo/simply-scheme:2:2))

;;; 6.3

(define (sign number)
  (cond ((< number 0) 'negative)
	((= number 0) 'zero)
	(else 'positive)))

;;; 6.4

(define (utensil meal)
  (if (equal? meal 'chinese) 'chopsticks 'fork))

;;; 6.5

(define (european-time timestr)
  (cond ((equal? (first timestr) '12)
	 (european-time (se (- (first timestr) 12) (last timestr))))
	((equal? (last timestr) 'am) (first timestr))
	((equal? (last timestr) 'pm) (+ (first timestr) 12))
	(else 'unknown)))

(define (american-time time)
  (cond ((= time 0)
	 (se '12 'am))
	((< time 12) (se time 'am))
	((= time 12) (se time 'pm))
	((< time 24) (se (- time 12) 'pm))
	(else (se (- time 12) 'pm))))

;;; 6.6

(define (teen? teen)
  (if (and (< teen 20) (>= teen 13)) true false))

;;; 6.7

(define (type-of obj)
  (cond ((sentence? obj) 'sentence)
	((number? obj) 'number)
	((word? obj) 'word)
	((boolean? obj) 'boolean)
	(else 'error)))

;;; 6.8

(define (vowel? letter)
  (member? letter 'aeiou))

(define (indef-article wd)
  (if (vowel? (first wd)) (se 'an wd)
      (se 'a wd)))

;;; 6.9

(define (plural wd)
  (word wd 's))

(define (thismany num wd)
  (if (= num 1) (se num wd)
      (se num (plural wd))))

;;; 6.10

(define (sort2 nums)
  (if (< (first nums) (last nums)) (se (first nums) (last nums))
      (se (last nums) (first nums))))

;;; 6.11

(define (divisible? big little)
  (= (remainder big little) 0))

(define (valid-date? month day year)
  (cond ((and (member? month '(1 3 5 7 8 10 12))
	      (and (<= day 31) (>= day 1))) true)
	((and (member? month '(4 6 9 11))
	      (and (<= day 30) (>= day 1))) true)
	((and (= month 2)
	      (and (divisible? year 100) (divisible? year 400))
	      (and (<= day 29) (>= day 1))) true)
	((and (= month 2)
	      (and (divisible? year 100) (not (divisible? year 400)))
	      (and (= day 29) (>= day 1))) false)
	((and (= month 2) (divisible? year 4)
	      (and (<= day 29) (>= day 1))) true)
	(else false)))

;;; 6.12

(define (plural wd)
  (cond ((and (equal? (last wd) 'y) (vowel? (last (bl wd)))) (word wd 's))
	((equal? (last wd) 'y) (word (bl wd) 'ies))
	((equal? (last wd) 'x) (word wd 'es))
	(else (word wd 's))
	))

;;; 6.13

(define (greet name)
  (cond ((equal? name '(david livingstone))
	 '(dr livingstone i presume))
	((member? (first name) '(king queen)) '(hello your majesty))
	(else
	 (cond ((member? (first name) '(dr mr ms mrs sr))
		(se 'hello (first name)
		    (if (member? (last name) '(jr sr iii))
			(last (bl name))
			(last name))))
	       (else (se 'hello (first name)))))))

;;; 6.14

(define (describe-time num)
  (cond ((< num 60) (se num 'seconds))
	((< num (* 60 60)) (se (/ num 60) 'minutes))
	((< num (* 60 60 60)) (se (/ num (* 60 60)) 'hours))
	((< num (* 60 60 60 24)) (se (/ num (* 60 60 24)) 'days))
	((< num (* 60 60 60 24 7)) (se (/ num (* 60 60 24 7)) 'weeks))
	((< num (* 60 60 60 24 365)) (se (/ num (* 60 60 24 365)) 'years))
	((< num (* 60 60 60 24 365 100)) (se (/ num (* 60 60 24 365 100)) 'centuries))
	(else '(too big))))
