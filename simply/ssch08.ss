;;; Time-stamp: <2015-03-08 15:24:05 wcohen>
;;; Created Sun Mar 08 12:23:27 2015

;;; Racket loads Simply Scheme extension
(require (planet dyoo/simply-scheme:2:2))

;;; 8.2

(keep vowel? 'birthday)
(every first '(golden slumbers))
(first '(golden slumbers))
(every last '(little child))
(accumulate word (every last '(little child)))
(every + '(2 3 4 5))
(accumulate + '(2 3 4 5))

;;; 8.4

(define (ends-vowel? wd) (vowel? (last wd)))
(define (even-count? wd) (even? (count wd)))

(define (choose-beatles fun)
  (keep fun '(john paul george ringo)))

;;; 8.5

(define (amazify name)
  (word 'the-amazing- name))

(define (transform-beatles fun)
  (every fun '(john paul george ringo)))

;;; 8.6

(define equal-first )

(define (phonetic ltr)
  (cond ((equal? ltr 'a) 'alfa)
	((equal? ltr 'b) 'bravo)
	((equal? ltr 'c) 'charlie)
	((equal? ltr 'd) 'delta)
	((equal? ltr 'e) 'echo)
	((equal? ltr 'f) 'foxtrot)
	((equal? ltr 'g) 'golf)
	((equal? ltr 'h) 'hotel)
	((equal? ltr 'i) 'india)
	((equal? ltr 'j) 'juliett)
	((equal? ltr 'k) 'kilo)
	((equal? ltr 'l) 'lima)
	((equal? ltr 'm) 'mike)
	((equal? ltr 'n) 'november)
	((equal? ltr 'o) 'oscar)
	((equal? ltr 'p) 'papa)
	((equal? ltr 'q) 'quebec)
	((equal? ltr 'r) 'romeo)
	((equal? ltr 's) 'sierra)
	((equal? ltr 't) 'tango)
	((equal? ltr 'u) 'uniform)
	((equal? ltr 'v) 'victor)
	((equal? ltr 'w) 'whiskey)
	((equal? ltr 'x) 'xray)
	((equal? ltr 'y) 'yankee)
	((equal? ltr 'z) 'zulu)
	))

(define (words wd)
  (every phonetic wd))

;;; 8.7

(define (always-one argument)
  1)

(define (count wd)
  (accumulate + (every always-one wd)))

(define (letter-count sent)
  (accumulate + (every count sent)))

;;; 8.8

(define (exag-word wd)
  (cond ((number? wd) (* wd 2))
	((equal? wd 'good) 'great)
	((equal? wd 'bad) 'terrible)
	(else wd)))

(define (exaggerate sent)
  (every exag-word sent))

;;; 8.9

sentence
sentence?
sentence

;;; 8.10

(define (true-for-all? pred sent)
  (= (count sent) (count (keep pred sent))))

;;; 8.11

(define (base-grade fullgrade)
  (let ((grade (first fullgrade)))
   (cond ((equal? grade 'a) '4)
	 ((equal? grade 'b) '3)
	 ((equal? grade 'c) '2)
	 ((equal? grade 'd) '1)
	 (else 0))))

(define (grade-modifier fullgrade)
  (let ((sign (last fullgrade)))
   (cond ((equal? sign '+) '.33)
	 ((equal? sign '-) '-.33)
	 (else '0))))

(define (final-grade grade)
  (+ (base-grade grade) (grade-modifier grade)))

(define (gpa grades)
  (/ (accumulate + (every final-grade grades)) (count grades)))

;;; 8.12

(define (equal-um? wd)
  (equal? 'um wd))

(define (count-ums sent)
  (count (keep equal-um? sent)))

;;; 8.13

(define (ltr-num ltr)
  (cond ((member? ltr '(a b c)) '2)
	((member? ltr '(d e f)) '3)
	((member? ltr '(g h i)) '4)
	((member? ltr '(j k l)) '5)
	((member? ltr '(m n o)) '6)
	((member? ltr '(p q r s)) '7)
	((member? ltr '(t u v)) '8)
	((member? ltr '(w x y z)) '9)
	(else '1)))

(define (phone-unspell num)
  (accumulate word (every ltr-num num)))

;;; 8.14

(define (subword phrase st fi)
  ((repeated bl (- (count phrase) fi))
   ((repeated bf (- st 1)) phrase)))
