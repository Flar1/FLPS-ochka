count_occurrences(_, [], 0).
count_occurrences(X, [X|T], N) :-
    count_occurrences(X, T, N1),
    N is N1 + 1.
count_occurrences(X, [Y|T], N) :-
    X \= Y,
    count_occurrences(X, T, N).

max_count([], 0).
max_count([N-_|T], Max) :-
    max_count(T, Max1),
    Max is max(N, Max1).

most_frequent_elements(List, MostFrequent) :-
    list_to_set(List, Set),
    findall(N-Element, (member(Element, Set), count_occurrences(Element, List, N)), CountedList),
    max_count(CountedList, MaxCount),
    findall(Element, (member(MaxCount-Element, CountedList)), MostFrequent).
