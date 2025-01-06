; есть ли в списке переданный элемент
(defun contains (lst el)
	(cond 
		((null lst) nil)
		((eq (car lst) el) T)
		(T (contains (cdr lst) el)))
)

;(print (contains '(3 2 1) 1))

; собственная реализация переворачивания списка
(defun myreverse (lst &optional res)
	(cond
		((null lst) res)
		(T (myreverse (cdr lst) (cons (car lst) res)))
	)
)

; (print (myreverse '(1 1 1 2 45)))
; (quit)

; поиск пересечения
(defun intersect (list1 list2 reslist)
	(cond 
		((null list1) reslist) ; первый список закончился - возвращаем результат
		(T (cond 
				((contains list2 (car list1)) ; если во втором списке есть текущий элемент из первого
					(cond 
						((null (contains reslist (car list1))) ; и в результате этого элемента ещё нет 
							(intersect 
								(cdr list1) 
								list2
								(cons (car list1) reslist )) ; добавляем текуший элемент к списку
						)
						(T (intersect (cdr list1) list2 reslist)); в результате этот элемент есть - не добавляем
					)
				)
				(T (intersect (cdr list1) list2 reslist)) ; во втором списке элемента нет - не добавляем
			)
		)
	)				
)

; фронтенд - вызов поиска пересечения и реверс результата
(defun myintersection (list1 list2 &optional reslist)
	(myreverse (intersect list1 list2 reslist))				
)


;(trace intersect)
;(print (myintersection '(1 2 2 3 4 5) '(1 2 5)))
(print (myintersection '(a b c d e f) '(a b f g)))



 