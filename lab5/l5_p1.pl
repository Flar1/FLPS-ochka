print_odd_numbers :-
    write('Введите нижнюю границу диапазона: '),
    read(Lower),
    write('Введите верхнюю границу диапазона: '),
    read(Upper),
    print_odd_desc(Lower, Upper).

print_odd_desc(Lower, Upper) :-
    Lower > Upper, !.

print_odd_desc(Lower, Upper) :-
    Upper mod 2 =:= 1,
    write(Upper), nl,
    NewUpper is Upper - 1,
    print_odd_desc(Lower, NewUpper).

print_odd_desc(Lower, Upper) :-
    Upper mod 2 =:= 0,
    NewUpper is Upper - 1,
    print_odd_desc(Lower, NewUpper).
