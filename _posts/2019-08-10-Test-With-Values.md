When testing a class using `@Value' set to a variable in the class, the variables value will not be set.  Opps!  No fun if your test needs to run through the code requiring the variable's value to be set. 

Solution:

Use the ReflectiionTestUtils.class to set the value of the variable


`underTest` - Class instanciated withing the test
`ReflectionTestUtils.setField(underTest, "variable_name", "variable_value");`
