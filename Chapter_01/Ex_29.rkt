#lang racket

(define (inc n) (+ n 1))
(define (cube n) (* n n n))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (sum2 term a next b m n)
  (if (> a b)
      0
      (+ (cond ((= m 0) (term a))
               ((= m n) (term a))
               ((= (remainder m 2) 1) (* 4 (term a)))
               (else (* 2 (term a))))
         (sum2 term (next a) next b (+ m 1) n))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (next n) (+ n h))
  (* (sum2 f a next b 0 n) (/ h 3.0)))

(define (simpson-integral f a b n)
   (define h (/ (- b a) n))
   (define (yk k) (f (+ a (* h k))))
   (define (simpson-term k)
     (* (cond ((or (= k 0) (= k n)) 1)
              ((odd? k) 4)
              (else 2))
        (yk k)))
   (* (/ h 3.0) (sum simpson-term 0 inc n)))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
"----------"
(simpson cube 0 1 100)
(simpson cube 0 1 1000)
"----------"
(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)
