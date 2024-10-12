function [recoms] = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  mat = read_mat(path);
  mat = preprocess(mat, min_reviews);
  [U,S,V] = svds(mat, num_features);
  [n, m] = size(V)
  a = zeros(n,1);
  for i = 1:n
    a(i) = cosine_similarity(V(i,:)', V(liked_theme,:)');
  end
  aux = 0;
  for i=1:n
    for j=1+i:n
      if a(i) < a(j)
        aux = a(i);
        a(i) = a(j);
        a(j) = aux;
      end
    end
  end
  recoms = zeros(1,num_recoms);
  for i =1:num_recoms
    for j = 1:n
      if a(i+1) == cosine_similarity(V(j,:)', V(liked_theme,:)')
        recoms(1,i) = j;
      end
    end 
  end 
end