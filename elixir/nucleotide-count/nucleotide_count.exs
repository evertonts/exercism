defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  def count('', _) do
    0
  end

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    [head | tail] = strand

    if head == nucleotide do
      1 + count(tail, nucleotide)
    else
      count(tail, nucleotide)
    end
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    %{ ?A => count(strand, ?A),
       ?T => count(strand, ?T),
       ?C => count(strand, ?C),
       ?G => count(strand, ?G)
     }
  end
end