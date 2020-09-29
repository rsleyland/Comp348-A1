package question1;

import java.math.BigDecimal;

public class Employee implements Person {

	private String firstName;
	private String lastName;
	private String id;
	private BigDecimal salary;
	
	public Employee() {
		firstName = "John";
		lastName = "Doe";
		id = "0000000";
		salary = new BigDecimal(0);
	}
	
	public Employee(String aFirstName, String aLastName, String anID, BigDecimal aSalary) {
		firstName = aFirstName;
		lastName = aLastName;
		id = anID;
		salary = aSalary; //BigDecimal is immutable, so this is okay.
	}
	
	public void setFirstName(String name) {firstName = name;}
	public void setLastName(String name) {lastName = name;}
	public void setID(String anID) {id = anID;}
	public void setSalary(BigDecimal aSalary) {salary = aSalary;}
	
	public String getFirstName() {return firstName;}
	public String getLastName() {return lastName;}
	public String getID() {return id;}
	public BigDecimal getSalaray() {return salary;}
	
	public String toString() {
		return (id + " " + firstName + " " + lastName + " " + salary);
	}
	
	public boolean equals(Object anotherObject) {
		if (anotherObject == null) return false;
		else if (anotherObject.getClass() != this.getClass()) return false;
		else
		{
			Employee anotherEmployee = (Employee) anotherObject;
			return(this.id.equals(anotherEmployee.id) && this.firstName.equals(anotherEmployee.firstName)
					&& this.lastName.equals(anotherEmployee.lastName) && this.salary.equals(anotherEmployee.salary));
		}
	}

	public String returnID() {return this.getID();}
	public String returnName() {return (this.getFirstName() + " " + this.getLastName());}
	
	public static Employee parse(String input){
		String anID = input.substring(0,input.indexOf(','));
		input = input.substring(input.indexOf(',') + 1 ,input.length() -1);
		
		String aFirstName = input.substring(0,input.indexOf(','));
		input = input.substring(input.indexOf(',') + 1 ,input.length() -1);
		
		String aLastName = input.substring(0,input.indexOf(','));
		input = input.substring(input.indexOf(',') + 1 ,input.length() -1);
		
		BigDecimal aSalary = new BigDecimal(Double.parseDouble(input));
		
		return new Employee(aFirstName, aLastName, anID, aSalary);
	}

}
