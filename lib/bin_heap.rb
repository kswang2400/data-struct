class BinHeap
  attr_reader :store

  def initialize(&prc)
    @store = Array.new
    @prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
  end

  def insert(value)
    @store << value
    self.class.heapify_up(@store, @store.length - 1, &@prc)
  end

  def extract
    raise "Heap is empty" if @store.empty?

    top_priority = @store[0]
    
    if @store.length > 1
      @store[0] = @store.pop
      self.class.heapify_down(@store, 0, &@prc)
    else
      @store.pop
    end
    top_priority  
  end

  protected
    attr_writer :prc, :store

  public
    def self.heapify_up(store, child_idx, &prc)
      prc = prc || Proc.new { |el1, el2| el1 <=> el2 }      
      return store if child_idx == 0 

      parent_idx = find_parent(child_idx)
      
      if prc.call(store[child_idx], store[parent_idx]) == -1
        store[child_idx], store[parent_idx] = store[parent_idx], store[child_idx]
        heapify_up(store, parent_idx, &prc)
      else
        return store
      end
    end

    def self.heapify_down(store, parent_idx, &prc)
      children_idx = find_children(parent_idx)
      c1_idx = children_idx[0]
      c2_idx = children_idx[1]

      if (store[c1_idx] != nil) && (prc.call(store[c1_idx], store[parent_idx]) == 1)
        store[c1_idx], store[parent_idx] = store[parent_idx], store[c1_idx]
        heapify_down(store, c1_idx, prc)
      elsif (store[c1_idx] != nil) && (prc.call(store[c2_idx], store[parent_idx]) == 1)
        store[c2_idx], store[parent_idx] = store[parent_idx], store[c2_idx]
        heapify_down(store, c2_idx, prc)
      else
        return store
      end
    end

    def self.find_children(parent_idx)
      return [(parent_idx * 2) + 1, (parent_idx * 2) + 2]
    end

    def self.find_parent(child_idx)
      if child_idx == 0 
        raise "Out of bounds"
      else
        return (child_idx - 1) / 2 
      end
    end
end

