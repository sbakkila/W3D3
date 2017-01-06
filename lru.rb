class LRUCache
  def initialize(length)
    @length = length
    @cache = []
  end

  def count
    @cache.count
    # returns number of elements currently in cache
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache.push(el)
    elsif count >= @length
      @cache.shift
      @cache.push(el)
    else
      @cache.push(el)
    end
  end
    # adds element to cache according to LRU principle

  def show
    p @cache# shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

end
