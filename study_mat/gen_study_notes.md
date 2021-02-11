## Study Session 2/9/2021 with Joe and Rachel
*Study tips*
- writing down how examples and discussion "verbalize" what's happening in the code

*Questions I missed*
- variable as pointers
  - "b is initalized to the object *to* which a is pointing"  
- variable scope
  - scope inside the block can access variable initiated outside the block; 
  - but outside scope can't access variable initiated inside the block.

*Follow-up*
- the assignment x reassignment or assignment?
    '''
    def plus(x, y)
      x = x + y #reassigning x? 
    end

    a = 3
    b = plus(a, 2)

    puts a #3
    puts b #5 
    '''
    