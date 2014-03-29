#lang racket

(define (square x) (* x x))
 
(define (ex3 a b c)
 (if (> a b)
     (if (> b c)
         (+ (square a) (square b)) ; a>b>c
         (+ (square a) (square c))) ; a>c>b or c>a>b
     (if (> a c)
         (+ (square b) (square a)) ; b>a>c
         (+ (square b) (square c))))) ; c>b>a or b>c>a

(define (test expr result)
  (cond ((not (= expr result)) "FALSE" )))

(test (ex3 2 3 4 ) 25)
(test (ex3 2 4 3 ) 25)
(test (ex3 3 2 4 ) 25)
(test (ex3 3 4 2 ) 25)
(test (ex3 4 3 2 ) 25)
(test (ex3 4 2 3 ) 25)

(test (ex3 3 3 2 ) 18)
(test (ex3 3 3 4 ) 25)
(test (ex3 2 3 3 ) 18)
(test (ex3 4 3 3 ) 25)
(test (ex3 3 2 3 ) 18)
(test (ex3 3 4 3 ) 25)