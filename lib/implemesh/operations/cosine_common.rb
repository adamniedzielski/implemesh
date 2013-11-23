
module Implemesh::Operations::CosineCommon

  def c(n)
    if n == 0
      Math.sqrt(1.0 / array.size)
    else
      Math.sqrt(2.0 / array.size)
    end
  end
end
