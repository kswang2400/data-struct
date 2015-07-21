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
      prc = prc || Proc.new { |el1, el2| el1 <=> el2 }      
      
      children_idx = find_children(store.length - 1, parent_idx)
      
      c0_idx = children_idx[0]
      c1_idx = children_idx[1]

      children = []
      children << store[c0_idx] if c0_idx
      children << store[c1_idx] if c1_idx

      parent = store[parent_idx]

      #When the parent index is where it's supposed to be
      if children.all? { |child| prc.call(child, parent) >= 0}
        return store
      end

      if store.length == 1
        swap_idx = c0_idx
      else
        swap_idx = prc.call(children[0], children[1]) == 1 ? c1_idx : c0_idx
      end

      store[swap_idx], store[parent_idx] = parent, store[swap_idx]

      heapify_down(store, swap_idx, &prc)
    end

    def self.find_children(last_idx, parent_idx)
      child1 = (parent_idx * 2) + 1
      child2 = (parent_idx * 2) + 2


      return [child1, child2].select{ |idx| idx <= last_idx }
    end

    def self.find_parent(child_idx)
      if child_idx == 0 
        raise "Out of bounds"
      else
        return (child_idx - 1) / 2 
      end
    end
end

