# coding: UTF-8
class Book

  STATUS_SUCCESS  = 1
  STATUS_MULTIPLE = 2
  STATUS_ERROR    = 3

  def initialize(id, name)
    @id = id
    @name = name
  end
  def getName
    return @name
  end
end
