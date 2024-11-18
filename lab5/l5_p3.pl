split_list([], _, _, [], [], []). 

split_list([X|Rest], Min, Max, [X|Less], Middle, Greater) :-
    X < Min,
    split_list(Rest, Min, Max, Less, Middle, Greater).

split_list([X|Rest], Min, Max, Less, [X|Middle], Greater) :-
    X >= Min,
    X =< Max,
    split_list(Rest, Min, Max, Less, Middle, Greater).

split_list([X|Rest], Min, Max, Less, Middle, [X|Greater]) :-
    X > Max,
    split_list(Rest, Min, Max, Less, Middle, Greater).

split_lists :- 
    writeln('Введите список чисел:'),
    read(List), 
    writeln('Введите меньшее число:'),
    read(Min), 
    writeln('Введите большее число:'),
    read(Max),  
    split_list(List, Min, Max, Less, Middle, Greater), 
    format('Элементы меньше ~d: ~w~n', [Min, Less]),
    format('Элементы от ~d до ~d: ~w~n', [Min, Max, Middle]),
    format('Элементы больше ~d: ~w~n', [Max, Greater]).