function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn
    fin = fopen(filename, 'r');
    n = fscanf(fin, '%d', 1);
    x = fscanf(fin, '%d', n+1);
    y = fscanf(fin, '%d', n+1);

    % TODO 1: Open the file for reading

    % TODO 2: Read n, x, y from the file

    % TODO 3: Close the file
    fclose(fin);
end