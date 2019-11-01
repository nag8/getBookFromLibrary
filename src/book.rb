# coding: UTF-8
class Book

  STATUS_RESERVED = 1
  STATUS_MULTIPLE = 2
  STATUS_ERROR    = 3
  STATUS_NO_BOOK  = 4

  def initialize(status, name)
    @status = status
    @name = name
  end

  def getName
    return @name
  end

  def getStatus
    return @status
  end
end
