fibonacci(0, 1). 
fibonacci(1, 1). 
fibonacci(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    Result is F1 + F2.


fibonacci_cycle :-
    repeat, 
    writeln('Введите номер числа Фибоначчи (отрицательное число для выхода):'),
    read(N), 
    (   N < 0 
    ->  writeln('Выход из программы.'),
        !
    ;   fibonacci(N, Result), 
        format('F(~d) = ~d~n', [N, Result]), 
        fail
    ).
