uses crt, system;
var input: file of char; 
    output: text; 
    m: array [1..10000] of char;
    nach, nach1, kon, kon1, n: integer; 
    s: string;
    
function fun: integer;
var i, j: integer; a: char;
begin
  for i := 1 to n - 1 do
  for j := 1 to n - i do
  if m[j] > m[j + 1] then begin
     a := m[j];
     m[j] := m[j + 1];
     m[j + 1] := a
     end;
end;
function fun1: integer;
var a: char;
begin
  for var i := 1 to n - 1 do
  for var j := 1 to n - i do
  if m[j] < m[j + 1] then begin
    a := m[j];
    m[j] := m[j + 1];
    m[j + 1] := a
    end;
end;

procedure pr(a, c: integer);
var p: array[1..1000] of char;
begin
    if c <= a then 
        exit 
    else 
    begin
     var x := (a + c) div 2;
      pr(a, x);
      pr(x + 1, c);
      var n1 := a;
      var n2 := x + 1;
        for var i := a to c do 
        begin
            if (n1 < x + 1) and ((n2 > c) or (m[n1] < m[n2])) then
            begin
                p[i] := m[n1];
                inc(n1);
            end 
            else 
            begin
            p[i] := m[n2];
            inc(n2);
            end;
        end;
        for var j := a to c do
            m[j] := p[j];
    end; 
end;
procedure prc(a, c: integer);
var e: array[1..1000] of char;
begin
    if c <= a then 
        exit 
    else 
    begin
     var x := (a + c) div 2;
     prc(a, x);
     prc(x + 1, c);
     var n1 := a;
     var n2 := x + 1;
        for var i := a to c do 
        begin
            if (n1 < x + 1) and ((n2 > c) or (m[n1] > m[n2])) then
            begin
                e[i] := m[n1];
                inc(n1);
            end 
            else 
            begin
                e[i] := m[n2];
                inc(n2);
            end;
        end;
        for var j := a to c do
            m[j] := e[j];
    end; 
end;

begin
  assign(input, 'D:\Колледж\Основы аллгоритм и программирования\Паскаль\Домашняяя контрольная №5\1.txt'); 
  assign(output, 'D:\Колледж\Основы аллгоритм и программирования\Паскаль\Домашняяя контрольная №5\1.1.txt');
  rewrite(input); 
  rewrite(output);
  writeln('Введите длинну массива: ');
  readln(n);
  writeln('Введите массив');
  for var i := 1 to n do
  begin
    readln(m[i]);
    write(input, m[i]);
  end;
  
  var st: integer;
  st := 1;
  while st <> 0 do
  begin
    clrscr;
    writeln('Выберите сортировку:');
    writeln('Сортировка пузырьком  - 1');
    writeln('Сортировка слиянием - 2');
    writeln('Выход из программы - 0');
    readln(st);
    nach := DateTime.Now.Second;
    nach1 := DateTime.Now.MilliSecond;
    case st of
      1: fun;
      2: fun1;
      0: exit;
    end;
    for var i := 1 to n do
      print(output, m[i]);
    kon := DateTime.Now.Second;
    kon1 := DateTime.Now.MilliSecond;
    close(output);
    reset(output);
    read(output, s);
    close(output);
    rewrite(output);
    write(s);
    writeln;
    writeln('Время выполнения программы: ', kon - nach, ' секнуд, ', abs(kon1 - nach1), ' милисекунд');
    writeln('Для продолжения программы нажмите enter 2 раза ');
    readln;
    readln;
  end;
end.
