class Book:
    
    STATUS_YET      = 0
    STATUS_SUCCESS  = 1
    STATUS_MULTIPLE = 2
    STATUS_NO_BOOK  = 3
    
    def __init__(self,id,name,auther,status=STATUS_YET):
        self.id = id
        self.name = name
        self.auther = auther
        self.status = status
