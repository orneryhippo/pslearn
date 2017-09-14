defmodule Servy.Scoring do
	
	@name :cosine_similarity_score

	def cosine_similarity(lhs, rhs) do
		{ab, aa, bb} = accumulate(lhs, rhs)
		ab / (:math.sqrt(aa) * :math.sqrt(bb))
	end

	defp accumulate(lhs, rhs) do
		accumulate(lhs, rhs, 0, 0, 0)
	end

	defp accumulate([], [], ab, aa, bb) do
		{ab, aa, bb}
	end

	defp accumulate([h1|t1], [h2|t2], ab, aa, bb) do
		accumulate(t1, t2,
		  ab + h1 * h2,
		  aa + h1 * h1,
		  bb + h2 * h2)
	end
end