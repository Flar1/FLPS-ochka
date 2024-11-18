main :-
    open('input.txt', read, In),
    read_lines(In, Lines),
    close(In),
    find_min_length_words(Lines, MinWords),
    open('output.txt', write, Out),
    write_words(Out, MinWords),
    close(Out),
    writeln('Слова минимальной длины записаны в файл output.txt').

read_lines(In, Words) :-
    read_lines(In, [], Words).

read_lines(In, Acc, Words) :-
    read_line_to_string(In, Line),
    (   Line == end_of_file -> reverse(Acc, Words)
    ;   split_string(Line, " ,.!?;:-", " ,.!?;:-", LineWords),
        append(Acc, LineWords, NewAcc),
        read_lines(In, NewAcc, Words)
    ).

find_min_length_words(Words, MinWords) :-
    maplist(string_length, Words, Lengths),
    min_list(Lengths, MinLen),
    include(is_min_length_word(MinLen), Words, MinWords).

is_min_length_word(MinLen, Word) :-
    string_length(Word, MinLen).

write_words(_, []) :- !.
write_words(Out, [Word|Rest]) :-
    writeln(Out, Word),
    write_words(Out, Rest).
