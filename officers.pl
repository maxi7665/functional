% type('infantry')
% type('infantry')

officer('yanos') .
officer('ferenz') .
officer('bela') .
officer('layos') .
officer('andras') .

% 1 - капитан
% 2 - майор
% 3 - подполковник

% один из них был капитаном, трое - майорами и один - в звании подполковника

% у Яноша такое же звание, как и у его друга сапера, следовательно; он майор
rank('yanos', 2) :- ! .
% Янош по званию старше Лайоша
%rank('yanos', X) :- rank('layos', X1), X > X1.
% Бела старше Ференца
%rank('bela', X) :- rank('ferenz', X1), X > X1.

rank('bela', X) :- X >= 1, X <= 3.

% Янош по званию старше Лайоша
rank('layos', X) :- rank('yanos', X1), X < X1, X >=1, X <=3.

rank('ferenz', X) :- rank('bela', X1), X < X1, X >=1, X <=3.

rank('andras', X) :- X >=1, X <=3.

