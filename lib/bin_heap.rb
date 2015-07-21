class BinHeap
  def initialize(&prc)
    @store = Array.new
    @prc = prc
  end

  def insert(value)
    @store << value
    self.class.heapify_up(@store, @store.length - 1, @prc)
  end

  def extract
    top_priority = @store[0]
    @store[0] = @store[@store.length - 1]


    self.class.heapify_down(@store, 0, &prc)
    return top_priority  
  end

  public
    def self.heapify_up(store, child_idx, &prc)
      comparator = prc || Proc.new { |el1, el2| el1 <=> el2 }
      
      parent_idx = find_parent(child_idx)
      if parent_idx > 0 && comparator.call(store[child_idx], store[parent_idx]) == 1
        store[child_idx], store[parent_idx] = store[parent_idx], store[child_idx]
        heapify_up(store, parent_idx, prc)
      else 
        return store
      end
    end

    def self.heapify_down(store, parent_idx, &prc)
      comparator = prc || Proc.new { |el1, el2| el1 <=> el2 }

      children_idx = find_children(store, parent_idx)
      c1_idx = children_idx[0]
      c2_idx = children_idx[1]

      if (store[c1_idx] != nil) && (comparator.call(store[c1_idx], store[parent_idx]) == 1)
        store[c1_idx], store[parent_idx] = store[parent_idx], store[c1_idx]
        heapify_down(store, c1_idx, prc)
      elsif (store[c1_idx] != nil) && (comparator.call(store[c2_idx], store[parent_idx]) == 1)
        store[c2_idx], store[parent_idx] = store[parent_idx], store[c2_idx]
        heapify_down(store, c2_idx, prc)
      else
        return store
      end
    end

    def find_children(store, parent_idx)
      return [(parent_idx * 2) + 1, (parent_idx * 2) + 2]
    end

    def find_parent(child_idx)
      if child_idx == 0 
        raise "Out of bounds"
      elsif child_idx % 2 == 0
        return (child_idx - 1) / 2 
      end
    end
end

