#lang racket

(define (make-point x y) (cons x y))
(define (x-point n) (car n))
(define (y-point n) (cdr n))

(define (make-rect tl br) (cons tl br))
(define (top-left r) (car r))
(define (bottom-right r) (cdr r))

(define (width-rect r)
  (let ((tl (top-left r))
        (br (bottom-right r)))
    (abs (- (x-point br) (x-point tl)))))         

(define (height-rect r)
  (let ((tl (top-left r))
        (br (bottom-right r)))
    (abs (- (y-point tl) (y-point br)))))

(define (area-rect r)
  (* (width-rect r) (height-rect r)))

(define (circum-rect r)
  (* (+ (width-rect r) (height-rect r)) 2))

(define myrect (make-rect (make-point 3 6) (make-point 7 3)))
(area-rect myrect)
(circum-rect myrect)