#lang racket

(define (square x) (* x x))

(define (expt-r b n)
  (expt-r-iter b n 1))

(define (expt-r-iter b counter product)
  (if (= counter 0)
      product
      (expt-r-iter b
                   (- counter 1)
                   (* b product))))

(define (fast-expt-r b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt-r b (/ n 2))))
        (else (* b (fast-expt-r b (- n 1))))))

(define (fast-expt-i b n)
  (define (fast-expt-i-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-i-iter a (square b) (/ n 2)))
          (else (fast-expt-i-iter (* a b) b (- n 1)))))
  (fast-expt-i-iter 1 b n))

(expt-r 3 5)
(fast-expt-r 3 5)
(fast-expt-i 3 5)

(expt-r 3 6)
(fast-expt-r 3 6)
(fast-expt-i 3 6)