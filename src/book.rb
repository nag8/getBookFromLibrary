# coding: UTF-8
class Book

  STATUS_YET      = 0
  STATUS_RESERVED = 1
  STATUS_MULTIPLE = 2
  STATUS_ERROR    = 3
  STATUS_NO_BOOK  = 4

  def initialize(id, name, status)
    @id = id
    @name = name
    @status = status
  end

  def getName
    return @name
  end

  def getStatus
    return @status
  end
end
