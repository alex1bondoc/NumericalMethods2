function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  AN = A / max(abs(A));
  BN = B / max(abs(B));
  similarity = AN' * BN / (norm(AN,2) * norm(BN, 2));
end

