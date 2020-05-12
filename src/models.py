class Book:
    
    STATUS_YET      = 0
    STATUS_SUCCESS  = 1
    STATUS_MULTIPLE = 2
    STATUS_ERROR    = 3
    
    def __init__(self,id,name,auther):
        self.id = id
        self.name = name
        self.auther = auther
        self.status = self.STATUS_YET
