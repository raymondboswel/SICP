(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) 
                     (+ 1 count))))
  (length-iter items 0))

(define (count-change amount)
  (cc amount uk-coins))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= (length kinds-of-coins) 0)) 
         0)
        (else 
         (+ (cc amount (cdr kinds-of-coins))
            (cc (- amount (car 
                           kinds-of-coins))
                kinds-of-coins)))))

(define us-coins 
  (list 50 25 10 5 1))

(define uk-coins 
  (list 0.5 100 50 20 10 5 2 1 ))

(count-change 100)