defmodule DNA do
  def encode_nucleotide(code_point) when code_point == ?A do
    <<value::4>> = <<0b0001::4>>
    value
  end

  def encode_nucleotide(code_point) when code_point == ?C do
    <<value::4>> = <<0b0010::4>>
    value
  end

  def encode_nucleotide(code_point) when code_point == ?G do
    <<value::4>> = <<0b0100::4>>
    value
  end

  def encode_nucleotide(code_point) when code_point == ?T do
    <<value::4>> = <<0b1000::4>>
    value
  end

  def encode_nucleotide(code_point) when code_point == ?\s do
    <<value::4>> = <<0b0000::4>>
    value
  end

  def decode_nucleotide(encoded_code) when encoded_code == 0b0001, do: ?A
  def decode_nucleotide(encoded_code) when encoded_code == 0b0010, do: ?C
  def decode_nucleotide(encoded_code) when encoded_code == 0b0100, do: ?G
  def decode_nucleotide(encoded_code) when encoded_code == 0b1000, do: ?T
  def decode_nucleotide(encoded_code) when encoded_code == 0b0000, do: ?\s

  def encode([dna_head]), do: <<encode_nucleotide(dna_head)::4>>
  def encode([dna_head | dna_tail]), 
    do: <<encode([dna_head])::bitstring, encode(dna_tail)::bitstring>>

  def decode(<<dna::4>>), do: [decode_nucleotide(dna)]
  def decode(<<dna_head::4, dna_tail::bits>>), 
    do: decode(<<dna_head::4>>) ++ decode(<<dna_tail::bits>>)
end
