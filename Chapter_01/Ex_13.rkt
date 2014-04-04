#lang racket

;x^2 - x - 1 = 0

;p = (1 + sqrt(5)) / 2
;q = (1 - sqrt(5)) / 2

;p^2 - p = q^2 - q = 1
;p + q = 1
;p - q = sqrt(5)
;pq = -1
;p^2 + q^2 = 3

;Fib(n-1) = (p^(n-1) - q^(n-1)) / sqrt(5)
;Fib(n) = (p^n - q^n) / sqrt(5)

;Fib(n+1) = [ p^n + p^(n-1) - q^n - q^(n-1) ] / sqrt(5)
;= [ p^(n-1){p + 1} - q^(n-1){q + 1} ] / sqrt(5)
;= [ p^(n-1){p^2} - q^(n-1){q^2} ] / sqrt(5)
;= [ p^(n+1) - q^(n+1) ] / sqrt(5)

;alpha = |q^n|/sqrt(5) < 0.5
;if q^n > 0
;Fib(n) = (p^n/sqrt(5) - q^n/sqrt(5)) = p^n/sqrt(5) - alpha
;if q^n < 0
;Fib(n) = (p^n/sqrt(5) - q^n/sqrt(5)) = p^n/sqrt(5) + alpha