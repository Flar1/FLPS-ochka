insert_sorted(Elem, [], [Elem]).  
insert_sorted(Elem, [Head|Tail], [Elem, Head|Tail]) :- Elem =< Head.  
insert_sorted(Elem, [Head|Tail], [Head|Rest]) :- Elem > Head, insert_sorted(Elem, Tail, Rest).

add_element :-
    write('Введите упорядоченный список: '),
    read(List),  % Читаем список, например [1, 2, 5, 7]
    write('Введите новый элемент: '),
    read(NewElem),  % Читаем новый элемент
    insert_sorted(NewElem, List, SortedList),  % Добавляем элемент в отсортированный список
    write('Обновленный список: '), nl,
    write(SortedList), nl.
