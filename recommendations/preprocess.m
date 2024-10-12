function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  [n,m] = size(mat);
  counter = 1;
  for i = 1:n
    cnt = 0;
    for j = 1:m
      if mat(i,j) > 0
        cnt = cnt+1;
      end
    end
    if cnt >= min_reviews
      reduced_mat(counter, :) = mat(i,:);
      counter = counter + 1;
    end
  end
end
